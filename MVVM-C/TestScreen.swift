//
//  TestScreen.swift
//  CoordinatorTester
//
//  Created by Alex Ng on 3/21/25.
//

import SwiftUI

struct TestScreen1: View {
    @ObservedObject var viewModel: TestScreenViewModel1
    @State private var isShowAlert: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("TestScreen1")
            pushButton
            setRootButton
            presentNext
            showAlertButton
        }
        .navigationBarTitle(Text("TestScreen1"))
        .navigationBarItems(trailing: navBarCancelButton)
        .alert("Important message", isPresented: $isShowAlert) {}
    }

    private var navBarCancelButton: some View {
        Button(action: viewModel.dismissTapped) {
            Text("Cancel")
        }
    }

    private var pushButton: some View {
        Button(action: viewModel.pushTapped) {
            Text("Push to Next Screen")
        }
    }

    private var setRootButton: some View {
        Button(action: viewModel.setRootTapped) {
            Text("Set Root to Next Screen")
        }
    }

    private var presentNext: some View {
        Button(action: viewModel.presentTapped) {
            Text("Present to Next Screen")
        }
    }

    private var showAlertButton: some View {
        Button(action: { isShowAlert = true }) {
            Text("Show Alert")
        }
    }
}

struct TestScreen2: View {
    @ObservedObject var viewModel: TestScreenViewModel2

    var body: some View {
        VStack(spacing: 10) {
            Text("TestScreen2")
            pushButton
            setRootButton
        }
        .navigationBarItems(trailing: navBarCancelButton)
    }

    private var pushButton: some View {
        Button(action: viewModel.pushTapped) {
            Text("Push to Next Screen")
        }
    }

    private var setRootButton: some View {
        Button(action: viewModel.setRootTapped) {
            Text("Set Root to Next Screen")
        }
    }

    private var navBarCancelButton: some View {
        Button(action: viewModel.dismissTapped) {
            Text("Cancel")
        }
    }
}

struct TestScreen3: View {
    @ObservedObject var viewModel: TestScreenViewModel3

    var body: some View {
        Text("TestScreen3")
            .navigationBarItems(trailing: navBarCancelButton)
    }

    private var navBarCancelButton: some View {
        Button(action: viewModel.dismissTapped) {
            Text("Cancel")
        }
    }
}
