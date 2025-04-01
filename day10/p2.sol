// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface College {
    function display() external view returns (string memory);
}
contract Department {
    string public deptName;
    string public deptHead;
    constructor(string memory _deptName, string memory _deptHead) {
        deptName = _deptName;
        deptHead = _deptHead;
    }
    function getDeptDetails() public view returns (string memory, string memory) {
        return (deptName, deptHead);
    }
    function printDeptDetails() public view returns (string memory) {
        return string(abi.encodePacked("Department: ", deptName, "\nHead: ", deptHead));
    }
}
contract Student is Department, College {
    string public studentName;
    string public regNo;
    uint public marks;
    string public collegeName;
    string public collegeCode;
    constructor(
        string memory _studentName,
        string memory _regNo,
        uint _marks,
        string memory _deptName,
        string memory _deptHead,
        string memory _collegeName,
        string memory _collegeCode
    ) Department(_deptName, _deptHead) {
        studentName = _studentName;
        regNo = _regNo;
        marks = _marks;
        collegeName = _collegeName;
        collegeCode = _collegeCode;
    }
    function getStudentDetails() public view returns (string memory, string memory, uint) {
        return (studentName, regNo, marks);
    }
    function printReportCard() public view returns (string memory) {
        return string(abi.encodePacked(
            "Student Name: ", studentName,
            "\nRegistration No: ", regNo,
            "\nMarks: ", marks,
            "\nDepartment: ", deptName,
            "\nDepartment Head: ", deptHead,
            "\nCollege: ", collegeName,
            "\nCollege Code: ", collegeCode
        ));
    }
    function display() public view override returns (string memory) {
        return string(abi.encodePacked("College Name: ", collegeName, "\nCollege Code: ", collegeCode));
    }
}