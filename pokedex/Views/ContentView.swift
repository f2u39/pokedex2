//
//  ContentView.swift
//  pokedex
//
//  Created by Fuu on 2022/09/23.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State var currentID: String = ""
    
    var body: some View {
        Button {
            addLiveActivity()
        } label: {
            Image(systemName: "play")
                .padding(.horizontal, 48)
                .padding(.vertical, 16)
        }
        
        PokemonList()
    }
    
    func removeActivity() {
        if let activity = Activity.activities.first(where: { (activity: Activity<PokemonAttributes>) in
            activity.id == currentID
        }){
            // FOR DEMO PURPOSE

            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                Task{
                    await activity.end(using: activity.contentState,dismissalPolicy: .immediate)
                }
            }
        }
    }
    
    // NOTE: We Need to Add Key In Info.plist File
    func addLiveActivity(){
        let workoutAtrributes = PokemonAttributes(workoutName: "Running")
        // Since It Dosen't Requires Any Intial Values
        // If Your Content State Struct Contains Intializers Then You Must Pass it here
        let intialContentState = PokemonAttributes.ContentState()
        
        do{
            let activity = try Activity<PokemonAttributes>.request(attributes: workoutAtrributes, contentState: intialContentState,pushType: nil)
            // MARK: Storing CurrentID For Updating Activity
            currentID = activity.id
            print("Activity Added Successfully. id: \(activity.id)")
        }catch{
            print(error.localizedDescription)
        }
    }
    
    //    @State var currentID: String = ""
    //    @State var currentSelection: Status = .stop
    //    @State var isWalking = false
    //
    //    var body: some View {
    //        NavigationView{
    //            VStack{
    //
    //                Spacer()
    //
    //                Image(systemName: "figure.run")
    //                    .resizable()
    //                    .foregroundColor(isWalking ? Color.yellow : Color.white)
    //                    .scaledToFit()
    //                    .frame(width: 200, height: 200)
    //
    //                Spacer()
    //
    //                Text("Running")
    //                    .foregroundColor(.white)
    //                    .font(.system(size: 32, weight: .bold))
    //                    .padding(.bottom, 48)
    //
    //
    //                Spacer()
    //
    //
    //                HStack{
    //                    Spacer()
    //
    //                    VStack {
    //                        Button {
    //                            removeActivity()
    //                        } label: {
    //                            Image(systemName: "xmark")
    //                                .padding(.horizontal, 48)
    //                                .padding(.vertical, 16)
    //                        }
    //                        .tint(.red)
    //                        .font(.title2)
    //                        .background(Color.red.opacity(0.3))
    //                        .cornerRadius(24)
    //
    //                        Text("End")
    //                            .font(.headline)
    //                            .foregroundColor(.white)
    //                    }
    //
    //                    Spacer()
    //
    //                    VStack {
    //                        Button {
    //                            addLiveActivity()
    //                        } label: {
    //                            Image(systemName: isWalking ? "pause" : "play")
    //                                .padding(.horizontal, 48)
    //                                .padding(.vertical, 16)
    //                        }
    //                        .tint(.yellow)
    //                        .font(.title2)
    //                        .background(Color.yellow.opacity(0.3))
    //
    //                        .cornerRadius(24)
    //
    //                        Text(isWalking ? "Pause" : "Resume")
    //                            .font(.headline)
    //                            .foregroundColor(.white)
    //                    }
    //
    //                    Spacer()
    //                }
    //
    //                Spacer()
    //
    //            }.navigationTitle("Workout")
    //            .preferredColorScheme(.dark)
    //            .background(Color.black)
    //            .onChange(of: currentSelection) { newValue in
    //                // Retreiving Current Activity From the List Of Phone Acitivites
    //                if let activity = Activity.activities.first(where: { (activity: Activity<WorkoutAttributes>) in
    //                    activity.id == currentID
    //                }){
    //                    print("Activity Found")
    //                    // Since I Need to Show Animation I'm Delaying Action For 2s
    //                    // For Demo Purpose
    //                    // In Real Case Scenairo Remove the Delay
    //                    if isWalking {
    //                        for _ in 0...9 {
    //                            DispatchQueue.global().asyncAfter(deadline: .now() + 2){
    //                                var updatedState = activity.contentState
    //                                //updatedState.status = currentSelection
    //                                updatedState.progress += 0.1
    //                                Task{
    //                                    await activity.update(using: updatedState)
    //                                }
    //                            }
    //                        }
    //                    }
    //
    //                }
    //            }
    //        }
    //
    //    }
    //
    //
    //
    //    func removeActivity(){
    //        if let activity = Activity.activities.first(where: { (activity: Activity<WorkoutAttributes>) in
    //            activity.id == currentID
    //        }){
    //            // FOR DEMO PURPOSE
    //            isWalking = false
    //            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
    //                Task{
    //                    await activity.end(using: activity.contentState,dismissalPolicy: .immediate)
    //                }
    //            }
    //        }
    //    }
    //
    //    // NOTE: We Need to Add Key In Info.plist File
    //    func addLiveActivity(){
    //        let workoutAtrributes = WorkoutAttributes(workoutName: "Running")
    //        // Since It Dosen't Requires Any Intial Values
    //        // If Your Content State Struct Contains Intializers Then You Must Pass it here
    //        let intialContentState = WorkoutAttributes.ContentState()
    //
    //        do{
    //            isWalking = true
    //            let activity = try Activity<WorkoutAttributes>.request(attributes: workoutAtrributes, contentState: intialContentState,pushType: nil)
    //            // MARK: Storing CurrentID For Updating Activity
    //            currentID = activity.id
    //            print("Activity Added Successfully. id: \(activity.id)")
    //        }catch{
    //            print(error.localizedDescription)
    //        }
    //    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
