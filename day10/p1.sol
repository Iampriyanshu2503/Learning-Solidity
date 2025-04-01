// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface Department {
    function getDeptDetails() external view returns (string memory, string memory);
    function printDeptDetails() external view returns (string memory);
}
contract Hostel {
    string public hostelName;
    string public hostelLocation;
    uint public numberOfRooms;
    constructor(string memory _hostelName, string memory _hostelLocation, uint _numberOfRooms) {
        hostelName = _hostelName;
        hostelLocation = _hostelLocation;
        numberOfRooms = _numberOfRooms;
    }
    function getHostelDetails() public view returns (string memory, string memory, uint) {
        return (hostelName, hostelLocation, numberOfRooms);
    }
    function printHostelDetails() public view returns (string memory) {
        return string(abi.encodePacked("Hostel Name: ", hostelName, "\nLocation: ", hostelLocation, "\nRooms: ", numberOfRooms));
    }
}
contract Student is Hostel, Department {
    string public studentName;
    string public regdNo;
    string public electiveSubject;
    uint public avgMarks;
    string public deptName;
    string public deptHead;
    constructor(
        string memory _studentName,
        string memory _regdNo,
        string memory _electiveSubject,
        uint _avgMarks,
        string memory _deptName,
        string memory _deptHead,
        string memory _hostelName,
        string memory _hostelLocation,
        uint _numberOfRooms
    ) Hostel(_hostelName, _hostelLocation, _numberOfRooms) {
        studentName = _studentName;
        regdNo = _regdNo;
        electiveSubject = _electiveSubject;
        avgMarks = _avgMarks;
        deptName = _deptName;
        deptHead = _deptHead;
    }
    function getData() public view returns (string memory, string memory, string memory, uint) {
        return (studentName, regdNo, electiveSubject, avgMarks);
    }
    function printData() public view returns (string memory) {
        return string(abi.encodePacked(
            "Name: ", studentName,
            "\nReg No: ", regdNo,
            "\nElective: ", electiveSubject,
            "\nAverage Marks: ", avgMarks
        ));
    }
    function getDeptDetails() public view override returns (string memory, string memory) {
        return (deptName, deptHead);
    }
    function printDeptDetails() public view override returns (string memory) {
        return string(abi.encodePacked("Department: ", deptName, "\nHead: ", deptHead));
    }
}
contract Driver {
    struct StudentData {
        Student studentContract;
        string regdNo;
    }
    mapping(string => StudentData) public students;
    string[] public regdNos;
    function admitStudent(
        string memory _studentName,
        string memory _regdNo,
        string memory _electiveSubject,
        uint _avgMarks,
        string memory _deptName,
        string memory _deptHead,
        string memory _hostelName,
        string memory _hostelLocation,
        uint _numberOfRooms
    ) public {
        Student newStudent = new Student(
            _studentName,
            _regdNo,
            _electiveSubject,
            _avgMarks,
            _deptName,
            _deptHead,
            _hostelName,
            _hostelLocation,
            _numberOfRooms
        );
        students[_regdNo] = StudentData(newStudent, _regdNo);
        regdNos.push(_regdNo);
    }
    function migrateStudent(string memory _regdNo, string memory _newHostel, string memory _newLocation, uint _newRooms) public {
        require(address(students[_regdNo].studentContract) != address(0), "Student not found");
        Student oldStudent = students[_regdNo].studentContract;
        students[_regdNo].studentContract = new Student(
            oldStudent.studentName(),
            _regdNo,
            oldStudent.electiveSubject(),
            oldStudent.avgMarks(),
            oldStudent.deptName(),
            oldStudent.deptHead(),
            _newHostel,
            _newLocation,
            _newRooms
        );
    }
    function displayStudent(string memory _regdNo) public view returns (string memory) {
        require(address(students[_regdNo].studentContract) != address(0), "Student not found");
        return students[_regdNo].studentContract.printData();
    }
}
