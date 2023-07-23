//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mapping {
    mapping(uint => string) public names;
    mapping(uint => Movie) public movies;
    mapping (address => mapping(uint => Movie)) public movieDetails;

    struct Movie {
        string name;
        string director;
    }

    constructor(){
        names[1] = "Mohammed Niyas";
        names[2] = "Sumaiya Niyas";
        names[3] = "Mohamed Azhaan";
    }

    function addMovie(
        uint _id, 
        string memory _name, 
        string memory _director
    ) public {
        movies[_id] = Movie(_name, _director);
    }

    function  addMovieDetail(
        uint _id, 
        string memory _name, 
        string memory _director
    ) public {
        movieDetails[msg.sender][_id] = Movie(_name, _director); 
    }


}