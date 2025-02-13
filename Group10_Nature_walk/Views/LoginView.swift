//
//  LoginView.swift
//  Group10_Nature_walk
//
//  Created by David Dang on 2025-02-06.
//

import SwiftUI

// The view that handles the login screen
struct LoginView: View {
    // Environment object to manage the session state (e.g., user session)
    @EnvironmentObject var sessionManager: SessionManager

    // State variables to hold the user input values and other UI states
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = false
    @State private var showAlert = false
    @State private var alertMessage = ""

    // Array of predefined users to validate the login credentials
    let users: [User]

    var body: some View {
        VStack(spacing: 20) {
            // Title of the login screen
            Text("Login")
            .font(.largeTitle).bold()

            // Email text field for user input
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .textContentType(.username)
                .autocapitalization(.none)

            // Password field for secure input
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.password)
                .autocapitalization(.none)

            // Remember Me toggle to save credentials for later sessions
            Toggle("Remember Me", isOn: $rememberMe)

            // Login button that triggers the login action
            Button(action: login) {
                Text("Login")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .onAppear(perform: loadSavedCredentials) // Calls the function when the view appears
        .alert(isPresented: $showAlert) { // Displays the alert based on showAlert
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    // Function to load saved user credentials if 'Remember Me' is enabled
    private func loadSavedCredentials() {
        if sessionManager.rememberMe {
            // Retrieve saved credentials from UserDefaults
            email = UserDefaults.standard.string(forKey: "savedEmail") ?? ""
            password = UserDefaults.standard.string(forKey: "savedPassword") ?? ""
            // Enable the 'Remember Me' toggle if credentials exist
            rememberMe = true
        }
    }

    // Function to handle the login process
    private func login() {
        // Validate input fields to ensure they are not empty
        guard !email.isEmpty else {
            alertMessage = "Email field cannot be empty."
            showAlert = true
            return
        }

        guard !password.isEmpty else {
            alertMessage = "Password field cannot be empty." 
            showAlert = true
            return
        }

        // Check if the entered email and password match any user in the users array
        if let user = users.first(where: { $0.email == email && $0.password == password }) {
            // Log in the user and store credentials if 'Remember Me' is selected
            sessionManager.login(user: user, rememberMe: rememberMe)
        } else {
            // Show error if login credentials are invalid
            alertMessage = "Invalid email or password. Please try again."
            showAlert = true
        }
    }
}
