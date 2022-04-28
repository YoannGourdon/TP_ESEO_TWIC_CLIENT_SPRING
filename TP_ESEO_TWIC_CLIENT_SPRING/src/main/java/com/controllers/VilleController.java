package com.controllers;

import java.util.ArrayList;

import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.beans.Ville;

@Controller
public class VilleController {

	private static final String URL = "http://localhost:8181/ville";
	private RestTemplate restTemplate = new RestTemplate();
	
	public ArrayList<Ville> getListVillesFromString(String text){
		ArrayList<Ville> listeVilles = new ArrayList<Ville>();
		String[] villesString = text.split("/");
		for (String string : villesString) {
			String[] infosString = string.split(";");
			
			String codeInsee = infosString[0];
			String nom = infosString[1];
			String codePo = infosString[2];
			String libelle = infosString[3];
			String ligne5 = infosString[4];
			String latitude = infosString[5];
			String longitude = infosString[6];
			
			listeVilles.add(new Ville(codeInsee, nom, codePo, libelle, ligne5, latitude, longitude));				
		}
		return listeVilles;
	}

	@RequestMapping(value = "/accueil" , method = RequestMethod.GET)
	public String get(@RequestParam(required  = false, value="codePostal") String codePostal, Model model) {
	
		String url = URL;
		if(!(codePostal == null || codePostal.equals(""))) {
			url = URL + "?codePostal=" + codePostal;
			model.addAttribute("codePostal", codePostal);
		}
		
		try {
			String villes = restTemplate.getForObject(url, String.class);
			model.addAttribute("villes", getListVillesFromString(villes));	
		} catch (NullPointerException e) {}
		return "accueil";
	}
	
	@RequestMapping(value = "/AjouterVille" , method = RequestMethod.GET)
	public String getAjouterVille() {
		return "AjouterVille";
	}
	
	
	@RequestMapping(value="/accueil", method = RequestMethod.POST)
	public String post(
			@RequestParam("code") String code,
			@RequestParam("nom") String nom,
			@RequestParam("codePostal") String codePostal,
			@RequestParam("libelle") String libelle,
			@RequestParam("ligne5") String ligne5,
			@RequestParam("latitude") String latitude,
			@RequestParam("longitude") String longitude,
			Model model) {
		
		Ville villeAdded = new Ville(code, nom, codePostal, libelle, ligne5, latitude, longitude);
		
		MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
		headers.add("Content-Type", "application/json");

		HttpEntity<Ville> request = new HttpEntity<>(villeAdded, headers);
		String result = restTemplate.postForObject(URL, request, String.class);
		System.out.println(result);
		
		try {
			String villes = restTemplate.getForObject(URL, String.class);
			model.addAttribute("villes", getListVillesFromString(villes));	
		} catch (NullPointerException e) {}
		
		return "accueil";
	}
	
	@RequestMapping(value = "/modifierVille" , method = RequestMethod.POST)
	public String getModifierVille(@RequestParam("code") String code,
			@RequestParam("nom") String nom,
			@RequestParam("codePostal") String codePostal,
			@RequestParam("libelle") String libelle,
			@RequestParam("ligne5") String ligne5,
			@RequestParam("latitude") String latitude,
			@RequestParam("longitude") String longitude,
			Model model) {
		
		Ville ville = new Ville(code, nom, codePostal, libelle, ligne5, latitude, longitude);
		model.addAttribute("ville", ville);
		return "modifierVille";
	}
	
	@RequestMapping(value="/put", method = RequestMethod.POST)
	public String put(
			@RequestParam("code") String code,
			@RequestParam("nom") String nom,
			@RequestParam("codePostal") String codePostal,
			@RequestParam("libelle") String libelle,
			@RequestParam("ligne5") String ligne5,
			@RequestParam("latitude") String latitude,
			@RequestParam("longitude") String longitude,
			Model model) {
		
		Ville villeAdded = new Ville(code, nom, codePostal, libelle, ligne5, latitude, longitude);
		
		System.out.println("test");
		System.out.println(villeAdded.toString());
		
		MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
		headers.add("Content-Type", "application/json");

		HttpEntity<Ville> request = new HttpEntity<>(villeAdded, headers);
		restTemplate.put(URL, request);
		
		try {
			String villes = restTemplate.getForObject(URL, String.class);
			model.addAttribute("villes", getListVillesFromString(villes));	
		} catch (NullPointerException e) {}
		
		return "accueil";
	}
	
	@RequestMapping(value = "/delete" , method = RequestMethod.POST)
	public String delete(@RequestParam(required  = true, value="codeInsee") String codeInsee, Model model) {
	
		String url = URL + "?code=" + codeInsee;
		try {
			restTemplate.delete(url);
			String villes = restTemplate.getForObject(URL, String.class);
			model.addAttribute("villes", getListVillesFromString(villes));	
		} catch (NullPointerException e) {}
		return "accueil";
	}
	
	@RequestMapping(value = "/calculDistance" , method = RequestMethod.GET)
	public String getCalculDistance(Model model) {
		try {
			String villes = restTemplate.getForObject(URL, String.class);
			model.addAttribute("villes", getListVillesFromString(villes));	
		} catch (NullPointerException e) {}
		return "calculDistance";
	}
	
	@RequestMapping(value = "/effectueCalcul" , method = RequestMethod.GET)
	public String getCalculDistance(@RequestParam("ville1") String ville1,
			@RequestParam("ville2") String ville2,
			Model model) {
		try {
			
			float latitudeVille1 = Float.parseFloat(ville1.split(";")[0]);
			float longitudeVille1 = Float.parseFloat(ville1.split(";")[1]);
			float latitudeVille2 = Float.parseFloat(ville2.split(";")[0]);
			float longitudeVille2 = Float.parseFloat(ville2.split(";")[1]);
			
			double calcul = Math.sqrt(Math.pow(latitudeVille2 - latitudeVille1, 2) + Math.pow(longitudeVille2 - longitudeVille1, 2));
			model.addAttribute("calcul", calcul);
			String villes = restTemplate.getForObject(URL, String.class);
			model.addAttribute("villes", getListVillesFromString(villes));	
		} catch (NullPointerException e) {}
		return "calculDistance";
	}

}
