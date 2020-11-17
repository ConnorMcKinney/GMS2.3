/// @description 
/// @param
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro MULTIPLAYER 1
function Events() constructor {
	signals = [];
	
	subscribe = function(event, fn) {
		var i = array_length(signals);
		
		signals[i] = {
			name: event,
			func: fn
		}
	}
	
	unsubscribe = function(event) {
		var newSignals = [];
		var j = 0;
		
		for(var i = 0; i < array_length(signals); i++) {
			var signal = signals[i];
			
			if(signal.name != event) {
				newSignals[j] = signals[i];
				j++;
			}
		}
		
		signals = newSignals;
	}
	
	emit = function(event, data) {
		for(var i = 0; i < array_length(signals); i++) {
			var signal = signals[i];
			
			if(signal.name == event) {
				signal.func(data);
			}
		}
	}
}

//global.events.emit("item_selected", itemData);
//global.events.subscribe("item_selected", function(data) {
//    // do stuff when the "item_selected" even gets emitted						
//});