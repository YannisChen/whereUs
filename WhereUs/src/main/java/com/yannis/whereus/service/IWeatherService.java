package com.yannis.whereus.service;

public interface IWeatherService {
	String request(String httpUrl, String httpArg,String apiKey);
}
