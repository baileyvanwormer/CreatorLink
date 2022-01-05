//
//  ProfileView.swift
//  create.
//
//  Created by Bailey Van Wormer on 12/9/21.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
        }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
}

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                AccountView()
            }
            else {
                SignInView()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}


struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Image("create.logo")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("Account Sign-In")
                .bold()
                .font(.title)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all)
            
            Text("Email:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal, .bottom])
            
            Text("Password:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            TextField("Password", text: $password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal, .bottom])
            
            Spacer()

            HStack {
                Text("Forgot Password?")
                    .padding(.all)
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.signIn(email: email, password: password)
                }) {
                    Text("Login")
                        .bold()
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.pink)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }

            HStack {
                Text("Don't have an account?")
                Button(action: {}) {
                }
                NavigationLink("Create Account", destination: SignUpView())
                    .padding(.all)
                    .cornerRadius(8)
                    .foregroundColor(Color.pink)
            }
            
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Image("create.logo")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("Account Sign-Up")
                .bold()
                .font(.title)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all)
            
            Text("Email:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal, .bottom])
            
            Text("Password:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            TextField("Password", text: $password)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal, .bottom])
            
            HStack {
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    viewModel.signUp(email: email, password: password)
                }) {
                    Text("Create Account")
                        .bold()
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color.pink)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }

            HStack {
                Text("Have an Account?")
                Button(action: {}) {
                    Text("Sign-In")
                        .bold()
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .cornerRadius(8)
                        .foregroundColor(Color.pink)
                }
            }
            Spacer()
            
        }
        .background(Color("background_color"))
        .ignoresSafeArea(.all, edges: .top)
    }
}




struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
    

