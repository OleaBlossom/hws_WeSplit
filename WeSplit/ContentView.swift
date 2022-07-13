//
//  ContentView.swift
//  WeSplit
//
//  Created by Olea Blossom on 04.06.22.
//

import SwiftUI

struct ContentView: View {
	@State private var checkAmount = 0.0
	@State private var numberOfPeople = 0
	@State private var tipPercentage = 20
	@FocusState private var amountIsFocused: Bool
	
	let tipPercentages = [10, 15, 20, 25, 0]
	
	var grandTotal: Double {
		let tipSelection = Double(tipPercentage)
		let tipTotal = checkAmount / 100 * tipSelection
		
		return checkAmount + tipTotal
	}
	
	var totalPerPerson: Double {
		let peopleCount = Double(numberOfPeople + 2)
		
		return grandTotal / peopleCount
	}
	
	var localCurrency: FloatingPointFormatStyle<Double>.Currency {
		return .currency(code: Locale.current.currencyCode ?? "USD")
	}
	
	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Amount", value: $checkAmount, format: localCurrency)
						.keyboardType(.decimalPad)
						.focused($amountIsFocused)
					
					Picker("Number of people", selection: $numberOfPeople) {
						ForEach(2..<100) {
							Text("\($0) people")
						}
					}
				}
				
				Section {
					Text(grandTotal, format: localCurrency)
				} header: {
					Text("Total cost")
				}
				
				Section {
					Picker("Tip percentage", selection: $tipPercentage) {
						ForEach(tipPercentages, id: \.self) {
							Text($0, format: .percent)
						}
					}
					.pickerStyle(.segmented)
				} header: {
					Text("How much tip do you want to leave?")
				}
				
				Section {
					Text(totalPerPerson, format: localCurrency)
				} header: {
					Text("Amount per person")
				}
			}
			.navigationTitle("weSplit")
			.toolbar {
				ToolbarItemGroup(placement: .keyboard) {
					Spacer()
					
					Button("Done") {
						amountIsFocused = false
					}
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
