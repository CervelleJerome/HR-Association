package com.openclassrooms.webapp.repository;

import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.openclassrooms.webapp.CustomProperties;
import com.openclassrooms.webapp.model.Employee;

import lombok.extern.slf4j.Slf4j;

@Slf4j  // Lombok annotation to create the logger instance
@Component
public class EmployeeProxy {

	@Autowired
	private CustomProperties props;

	/**
	 * Get all employees
	 * @return An iterable of all employees
	 */
	public Iterable<Employee> getEmployees() {

		System.out.println("props.getApiUrl() = " + props.getApiUrl());
		String baseApiUrl = props.getApiUrl();
		String getEmployeesUrl = baseApiUrl + "/employees";

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Iterable<Employee>> response = restTemplate.exchange(
				getEmployeesUrl,
				HttpMethod.GET,
				null,
				new ParameterizedTypeReference<Iterable<Employee>>() {}
		);

		//log.debug("Get Employees call status: " + response.getStatusCode().toString());  // Logging the HTTP response status
		//log.debug("Get Employees call status: {}", response.getStatusCode().toString());  // Logging the HTTP response status
		return response.getBody();
	}

	/**
	 * Get an employee by the id
	 * @param id The id of the employee
	 * @return The employee which matches the id
	 */
	public Employee getEmployee(int id) {
		String baseApiUrl = props.getApiUrl();
		String getEmployeeUrl = baseApiUrl + "/employee/" + id;

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Employee> response = restTemplate.exchange(
				getEmployeeUrl,
				HttpMethod.GET,
				null,
				Employee.class
		);

		//log.debug("Get Employee call status for id {}: {}", id, response.getStatusCode().toString());  // Logging the HTTP response status

		return response.getBody();
	}

	/**
	 * Add a new employee
	 * @param e A new employee (without an id)
	 * @return The employee full filled (with an id)
	 */
	public Employee createEmployee(Employee e) {
		String baseApiUrl = props.getApiUrl();
		String createEmployeeUrl = baseApiUrl + "/employee";

		RestTemplate restTemplate = new RestTemplate();
		HttpEntity<Employee> request = new HttpEntity<Employee>(e);
		ResponseEntity<Employee> response = restTemplate.exchange(
				createEmployeeUrl,
				HttpMethod.POST,
				request,
				Employee.class);

		//log.debug("Create Employee call status: " + response.getStatusCode().toString());  // Logging the HTTP response status

		return response.getBody();
	}

	/**
	 * Update an employee - using the PUT HTTP Method.
	 * @param e Existing employee to update
	 */
	public Employee updateEmployee(Employee e) {
		String baseApiUrl = props.getApiUrl();
		String updateEmployeeUrl = baseApiUrl + "/employee/" + e.getId();

		RestTemplate restTemplate = new RestTemplate();
		HttpEntity<Employee> request = new HttpEntity<Employee>(e);
		ResponseEntity<Employee> response = restTemplate.exchange(
				updateEmployeeUrl,
				HttpMethod.PUT,
				request,
				Employee.class);

		//log.debug("Update Employee call status for id {}: {}", e.getId(), response.getStatusCode().toString());  // Logging the HTTP response status

		return response.getBody();
	}

	/**
	 * Delete an employee using exchange method of RestTemplate
	 * instead of delete method in order to log the response status code.
	 * @param e The employee to delete
	 */
	public void deleteEmployee(int id) {
		String baseApiUrl = props.getApiUrl();
		String deleteEmployeeUrl = baseApiUrl + "/employee/" + id;

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Void> response = restTemplate.exchange(
				deleteEmployeeUrl,
				HttpMethod.DELETE,
				null,
				Void.class);

		//log.debug("Delete Employee call status for id {}: {}", id, response.getStatusCode().toString());  // Logging the HTTP response status
	}

}
