package controller;

import controller.action.Action;
import controller.action.FestivalReviewDeleteAction;

public class ActionFactory {
	// Singletone
	private ActionFactory() {}
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getInstance() {
		return instance;
	}
	
	//
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("festivalReviewDelete")) {
			action = new FestivalReviewDeleteAction();
		}
		return action;
	}
}
