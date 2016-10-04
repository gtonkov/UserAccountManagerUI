<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>User Account Manager</title>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.min.js"></script>
		<script src="scripts/applicationConfiguration.js"></script>
		<script src="scripts/applicationModules.js"></script>
		<script src="scripts/accountService.js"></script>
		<script src="scripts/accountController.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		<link rel="stylesheet" href="style/style.css">
	</head>
	
	<body ng-app="AccountApp" class="ng-cloak">
		<div class="generic-container" ng-controller="AccountController as accController" ng-cloak>
			<div class="panel panel-default">
				<div class="formcontainer">
					<div class="panel-heading"><span class="lead">Create new user account</span></div>
					<div class="formcontainer">
						<form ng-submit="accController.submit()" name="createAccountForm" class="form-horizontal">
						<input type="hidden" ng-model="accController.account.id" />
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="firstName">First name: </label>
								<div class="col-md-7">
									<input type="text" ng-model="accController.account.firstName" id="firstName" class="form-control input-sm" placeholder="Enter your first name here" required ng-minlength="1"/>
									<div class="has-error" ng-show="createAccountForm.$dirty">
										<span ng-show="createAccountForm.firstName.$error.required">You should enter your first name</span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="lastName">Last name: </label>
								<div class="col-md-7">
									<input type="text" ng-model="accController.account.lastName" id="lastName" class="form-control input-sm" placeholder="Enter your last name here " required ng-minlength="1"/>
									<span ng-show="createAccountForm.lastName.$error.required">You should enter your last name</span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="dateOfBirth">Date of Birth: </label>
								<div class="col-md-7">
									<input type="text" ng-model="accController.account.dateOfBirth" id="dateOfBirth" class="form-control input-sm" placeholder="Enter your birthdate in dd-MM-yyyy format" required ng-minlength="10"/>
									<div class="has-error" ng-show="createAccountForm.$dirty">
										<span ng-show="createAccountForm.dateOfBirth.$error.required">You should enter your date of birth</span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="email">Email: </label>
								<div class="col-md-7">
									<input type="email" ng-model="accController.account.email" id="email" class="form-control input-sm" placeholder="Enter your email address here" required ng-minlength="6"/>
									<div class="has-error" ng-show="createAccountForm.$dirty">
										<span ng-show="createAccountForm.email.$error.required">You should enter your email address</span>
										<span ng-show="createAccountForm.email.$invalid">This email is invalid </span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-actions floatRight">
								<input type="submit"  value="{{ !accController.account.id ? 'Add' : 'Update' }}" class="btn btn-primary btn-sm">
								<button type="button" ng-click="accController.reset()" class="btn btn-warning btn-sm">Reset</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading"><span class="lead">Current accounts: </span></div>
				<div class="tablecontainer">
					<table class="table table-hover">
						<thead>
							<tr>
								<th><a href="#SortingAnchor" ng-click="predicate = 'ID';sortType = 'id'; sortReverse = !sortReverse">ID</a></th>
								<th><a href="#SortingAnchor" ng-click="sortType = 'firstName'; sortReverse = !sortReverse">First Name</a></th>
								<th><a href="#SortingAnchor" ng-click="sortType = 'lastName'; sortReverse = !sortReverse">Last Name</a></th>
								<th><a href="#SortingAnchor" ng-click="sortType = 'dateOfBirth'; sortReverse = !sortReverse">Date of Birth</a></th>
								<th><a href="#SortingAnchor" ng-click="sortType = 'email'; sortReverse = !sortReverse">Email</a></th>
								<th width="100"></th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="acc in accController.accounts | orderBy:sortType:sortReverse">
								<td>{{acc.id}}</td><td>{{acc.firstName}}</td> <td>{{acc.lastName}}</td><td>{{acc.dateOfBirth}}</td><td>{{acc.email}}</td>
								<td><button type="button" ng-click="accController.edit(acc.id)" class="btn btn-success button-width">Edit</button></td>
								<td><button type="button" ng-click="accController.remove(acc.id)" class="btn btn-danger button-width">Remove</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</body>
</html>