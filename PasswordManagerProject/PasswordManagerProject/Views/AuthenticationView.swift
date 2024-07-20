//
//  AuthenticationView.swift
//  PasswordManagerProject
//
//  Created by Gaurav Bhatt on 20/07/24.
//

//import SwiftUI
//import LocalAuthentication
//
//struct AuthenticationView: View {
//    //MARK: Variables
//    @Binding var isAuthenticated: Bool
//    //MARK: Life cycle
//    var body: some View {
//        VStack(alignment: .center) {
//            Text("You want to enable authentication?")
//                .font(
//                    Font.custom("Poppins", size: 19)
//                        .weight(.bold)
//                )
//            
//            Button(action: {
//                authenticateBiomatricAndFace()
//            }) {
//                Text("Yes")
//                    .font(
//                        Font.custom("Poppins", size: 15)
//                            .weight(.semibold)
//                    )
//                    .frame(height: 40)
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                    .foregroundColor(.white)
//                    .background(Color(UIColor.App_Colors.appButtonRedColor))
//                    .cornerRadius(20)
//            }
//            .padding()
//            
//            if !(userDefaultData.authentication.getDefaultValue() as? Bool ?? false) {
//                Button(action: {
//                    isAuthenticated = true
//                    userDefaultData.authentication.saveDefaultValue(false)
//                }) {
//                    Text("No")
//                        .font(
//                            Font.custom("Poppins", size: 15)
//                                .weight(.semibold)
//                        )
//                        .frame(height: 40)
//                        .frame(minWidth: 0, maxWidth: .infinity)
//                        .foregroundColor(.white)
//                        .background(Color(UIColor.App_Colors.appButtonBlackColor))
//                        .cornerRadius(20)
//                }
//                .padding()
//            }
//        }
//        .padding()
//        .onAppear {
//            if (userDefaultData.authentication.getDefaultValue() as? Bool ?? false) {
//                authenticateBiomatricAndFace()
//            }
//        }
//    }
//    
//    //Face & Touch authentication
//    func authenticateBiomatricAndFace() {
//        let context = LAContext()
//        var error: NSError?
//        
//        // Check if the device is capable of biometric authentication
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            let reason = "Log in to your account"
//            
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
//                DispatchQueue.main.async {
//                    if success {
//                        userDefaultData.authentication.saveDefaultValue(true)
//                        self.isAuthenticated = true
//                    } else {
//                        authenticateWithPasscode()
//                    }
//                }
//            }
//        } else {
//            if let laError = error as? LAError {
//                // Handle the specific error code
//                switch laError.code {
//                case .biometryNotAvailable:
//                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
//                case .biometryNotEnrolled:
//                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
//                case .biometryLockout:
//                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
//                default:
//                    self.isAuthenticated = true
//                }
//            } else {
//                self.isAuthenticated = true
//            }
//        }
//    }
//    
//    //Passcode authentication
//    func authenticateWithPasscode() {
//        let context = LAContext()
//        let reason = "Please enter your passcode"
//        
//        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
//            DispatchQueue.main.async {
//                if success {
//                    self.isAuthenticated = true
//                } else {
//                    
//                }
//            }
//        }
//    }
//}
//
//
//#Preview {
//    AuthenticationView(isAuthenticated: .constant(false))
//}

//import LocalAuthentication
//import SwiftUI
//
//struct AuthenticationView: View {
//    // MARK: Variables
//    @Binding var isAuthenticated: Bool
//    
//    // MARK: Life cycle
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Enable Authentication")
//                .font(
//                    Font.custom("Poppins", size: 24)
//                        .weight(.bold)
//                )
//                .padding([.bottom, .top], 20)
//            
//            VStack(spacing: 20) {
//                Button(action: {
//                    authenticateBiometricAndFace()
//                }) {
//                    HStack {
//                        Image(systemName: "lock.shield")
//                            .foregroundColor(.white)
//                        Text("Use Face/Touch ID")
//                            .font(
//                                Font.custom("Poppins", size: 16)
//                                    .weight(.semibold)
//                            )
//                            .foregroundColor(.white)
//                    }
//                    .frame(height: 50)
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                    .background(Color(UIColor.App_Colors.appButtonRedColor))
//                    .cornerRadius(25)
//                }
//                
//                if !(userDefaultData.authentication.getDefaultValue() as? Bool ?? false) {
//                    Button(action: {
//                        isAuthenticated = true
//                        userDefaultData.authentication.saveDefaultValue(false)
//                    }) {
//                        HStack {
//                            Image(systemName: "xmark.octagon")
//                                .foregroundColor(.white)
//                            Text("No, Thanks")
//                                .font(
//                                    Font.custom("Poppins", size: 16)
//                                        .weight(.semibold)
//                                )
//                                .foregroundColor(.white)
//                        }
//                        .frame(height: 50)
//                        .frame(minWidth: 0, maxWidth: .infinity)
//                        .background(Color(UIColor.App_Colors.appButtonBlackColor))
//                        .cornerRadius(25)
//                    }
//                }
//            }
//            .padding(.horizontal, 40)
//            .padding(.vertical, 20)
//        }
//        .background(
//            LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemBackground), Color(UIColor.secondarySystemBackground)]), startPoint: .top, endPoint: .bottom)
//        )
//        .cornerRadius(20)
//        .shadow(radius: 10)
//        .padding()
//        .onAppear {
//            if (userDefaultData.authentication.getDefaultValue() as? Bool ?? false) {
//                authenticateBiometricAndFace()
//            }
//        }
//    }
//    
//    // Face & Touch authentication
//    func authenticateBiometricAndFace() {
//        let context = LAContext()
//        var error: NSError?
//        
//        // Check if the device is capable of biometric authentication
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            let reason = "Log in to your account"
//            
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
//                DispatchQueue.main.async {
//                    if success {
//                        userDefaultData.authentication.saveDefaultValue(true)
//                        self.isAuthenticated = true
//                    } else {
//                        authenticateWithPasscode()
//                    }
//                }
//            }
//        } else {
//            if let laError = error as? LAError {
//                // Handle the specific error code
//                switch laError.code {
//                case .biometryNotAvailable, .biometryNotEnrolled, .biometryLockout:
//                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
//                default:
//                    self.isAuthenticated = true
//                }
//            } else {
//                self.isAuthenticated = true
//            }
//        }
//    }
//    
//    // Passcode authentication
//    func authenticateWithPasscode() {
//        let context = LAContext()
//        let reason = "Please enter your passcode"
//        
//        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
//            DispatchQueue.main.async {
//                if success {
//                    self.isAuthenticated = true
//                } else {
//                    // Handle passcode authentication failure if needed
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    AuthenticationView(isAuthenticated: .constant(false))
//}

import LocalAuthentication
import SwiftUI

struct AuthenticationView: View {
    // MARK: Variables
    @Binding var isAuthenticated: Bool
    @State private var showView = false // State variable for animation
    
    // MARK: Life cycle
    var body: some View {
        VStack(spacing: 20) {
            Text("Enable Authentication")
                .font(
                    Font.custom("Poppins", size: 24)
                        .weight(.bold)
                )
                .padding([.bottom, .top], 20)
            
            VStack(spacing: 20) {
                Button(action: {
                    authenticateBiometricAndFace()
                }) {
                    HStack {
                        Image(systemName: "lock.shield")
                            .foregroundColor(.white)
                        Text("Use Face/Touch ID")
                            .font(
                                Font.custom("Poppins", size: 16)
                                    .weight(.semibold)
                            )
                            .foregroundColor(.white)
                    }
                    .frame(height: 50)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color(UIColor.App_Colors.appButtonRedColor))
                    .cornerRadius(25)
                }
                
                if !(userDefaultData.authentication.getDefaultValue() as? Bool ?? false) {
                    Button(action: {
                        isAuthenticated = true
                        userDefaultData.authentication.saveDefaultValue(false)
                    }) {
                        HStack {
                            Image(systemName: "xmark.octagon")
                                .foregroundColor(.white)
                            Text("No, Thanks")
                                .font(
                                    Font.custom("Poppins", size: 16)
                                        .weight(.semibold)
                                )
                                .foregroundColor(.white)
                        }
                        .frame(height: 50)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color(UIColor.App_Colors.appButtonBlackColor))
                        .cornerRadius(25)
                    }
                }
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemBackground), Color(UIColor.secondarySystemBackground)]), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
        .scaleEffect(showView ? 1 : 0.5)
        .opacity(showView ? 1 : 0)
        .animation(.easeInOut(duration: 0.8), value: showView)
        .onAppear {
            showView = true
            if (userDefaultData.authentication.getDefaultValue() as? Bool ?? false) {
                authenticateBiometricAndFace()
            }
        }
    }
    
    // Face & Touch authentication
    func authenticateBiometricAndFace() {
        let context = LAContext()
        var error: NSError?
        
        // Check if the device is capable of biometric authentication
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Log in to your account"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        userDefaultData.authentication.saveDefaultValue(true)
                        self.isAuthenticated = true
                    } else {
                        authenticateWithPasscode()
                    }
                }
            }
        } else {
            if let laError = error as? LAError {
                // Handle the specific error code
                switch laError.code {
                case .biometryNotAvailable, .biometryNotEnrolled, .biometryLockout:
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                default:
                    self.isAuthenticated = true
                }
            } else {
                self.isAuthenticated = true
            }
        }
    }
    
    // Passcode authentication
    func authenticateWithPasscode() {
        let context = LAContext()
    }
}

#Preview {
    AuthenticationView(isAuthenticated: .constant(false))
}


