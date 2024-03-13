// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Salva_vida {

    IERC20 public mby;
    address public direccion_mby;
    uint256 public constant preciotoken = 0.001 ether;
    uint256 public constant minima_compra = 10 * 10**18;
    
    enum Project { vegetal, animal, humano }
    mapping(Project => uint256) public Costo_proyectos;
    event TokensPurchased(address buyer, uint256 amount);
    event InvestedInProject(address investor, Project project, uint256 tokens, uint256 quantity, string message);

    constructor(address token) {
        direccion_mby = token;
        mby = IERC20(address(token)); 
        Costo_proyectos[Project.vegetal] = 1 * 10**18; // costo de 1 MBY para plantar arboles 
        Costo_proyectos[Project.animal] = 2 * 10**18; // costo de 2 MBY para plantar arboles
        Costo_proyectos[Project.humano] = 5 * 10**18; // costo de 5 MBY para plantar arboles
    }

    function CompraMBY()payable public returns(bool) {
        uint256 monto_compra = msg.value * 1000;
        uint256 monto_total = mby.balanceOf(address(this));
        require(monto_compra > 0, "Monto debe ser mayor a 0 SPH");
        require(monto_compra < monto_total, "No hay suficientes MBY");
        mby.transfer(msg.sender, monto_compra);
        return true;
    }

    function VendeMBY(uint256 monto) public returns(bool){
        require(monto > 0, "No quedan MBY para vender");
        mby.transferFrom(msg.sender, payable (address(this)), monto);
        payable(msg.sender).transfer(monto/1000);
        return true;
    }

    function Invierte(uint256 amount, Project project) external {
        require(amount >= Costo_proyectos[project], "No hay suficientes MBY para invertir");
        require(mby.balanceOf(msg.sender) >= amount, "Balance de MBY insuficiente");
        require(mby.allowance(msg.sender, address(this)) >= amount, "Checkear los permisos de MBY");

        mby.transferFrom(msg.sender, address(this), amount);
        uint256 quantity = amount / Costo_proyectos[project];

    string memory projectName;
        if (project == Project.vegetal) {
            projectName = "arboles";
        } else if (project == Project.animal) {
            projectName = "animales";
        } else if (project == Project.humano) {
            projectName = "indigentes";
        }
        string memory message = string(abi.encodePacked("Has invertido ", uint2str(amount / 1e18), " en ", projectName, "."));

        emit InvestedInProject(msg.sender, project, amount, quantity, message);
    }

        function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        while (_i != 0) {
            k = k-1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }

}