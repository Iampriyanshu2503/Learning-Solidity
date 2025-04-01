// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract Employee {
    // State variables
    string public name;
    string public location; // Stores physical location (e.g., city name)
    uint256 public salary;
    string public jobTitle;
    constructor(string memory _name, string memory _location, uint256 _salary, string memory _jobTitle) {
        name = _name;
        location = _location;
        salary = _salary;
        jobTitle = _jobTitle;
    }
    function calculateBonus() public view virtual returns (uint256) {
        return 0;
    }
    function performanceReport() public view virtual returns (string memory) {
        return "Performance report not available.";
    }
    function manageProjects() public view virtual returns (string memory) {
        return "Project management not available.";
    }
}
contract Manager is Employee {
    constructor(string memory _name, string memory _location, uint256 _salary, string memory _jobTitle) 
        Employee(_name, _location, _salary, _jobTitle) {}
    function calculateBonus() public view override returns (uint256) {
        return (salary * 20) / 100;
    }
    function performanceReport() public view override returns (string memory) {
        return string(abi.encodePacked("Manager performance: Excellent leadership and coordination. Job Title: ", jobTitle));
    }
    function manageProjects() public view override returns (string memory) {
        return string(abi.encodePacked("Manager with title ", jobTitle, " is overseeing multiple projects."));
    }
}
contract Developer is Employee {
    constructor(string memory _name, string memory _location, uint256 _salary, string memory _jobTitle) 
        Employee(_name, _location, _salary, _jobTitle) {}
    function calculateBonus() public view override returns (uint256) {
        return (salary * 10) / 100;
    }
    function performanceReport() public view override returns (string memory) {
        return string(abi.encodePacked("Developer performance: High-quality code delivery. Job Title: ", jobTitle));
    }
    function manageProjects() public view override returns (string memory) {
        return string(abi.encodePacked("Developer with title ", jobTitle, " contributes to project coding tasks."));
    }
}
contract Programmer is Employee {
    constructor(string memory _name, string memory _location, uint256 _salary, string memory _jobTitle) 
        Employee(_name, _location, _salary, _jobTitle) {}
    function calculateBonus() public view override returns (uint256) {
        return (salary * 8) / 100;
    }
    function performanceReport() public view override returns (string memory) {
        return string(abi.encodePacked("Programmer performance: Efficient bug fixing and coding. Job Title: ", jobTitle));
    }
    function manageProjects() public view override returns (string memory) {
        return string(abi.encodePacked("Programmer with title ", jobTitle, " supports project development tasks."));
    }
}