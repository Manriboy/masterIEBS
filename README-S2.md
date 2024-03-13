# Sprint 2

## Objetivos del proyecto

Este proyecto tiene como objetivo el crear un token nuevo llamado MomBreY 3.0 con el cuál poder invertir en proyectos medio ambientales y de solidaridad de tres (3) índoles. Se puede invertir en plantar árboles, en rescatar animales de la calle o en alimentar personas en situación de calle. El proyecto consta de dos (2) contratos. El primer contrato consiste en la creación de 1.000.000 (1M) de MomBrey tokens (MBY) que tendrán un valor de 0.001 ETH y que servirán para invertir en los tres (3) diferentes proyectos. El segiundo contrato es para comprar los tokens MBY y poder inverir en el proyecto que el usuario estime conveniente. A continuación, se presentan los códigos de ambos contratos y sus respectivas direcciones y respaldos.

## Explicación de contratos

### Contrato 1: Sprint_2_MBY-token.sol

El primero contrato tiene como objetivo la creación del token MBY. Se pide la creación de 1.000.000 de tokens y además se incluye una función que permite la creación de más tokens si es necesario. Estos códigos son obtenidos de las clases y vienen todas las funciones correspondientes a la documentación ERC20 

<img width="528" alt="Captura de pantalla 2024-03-13 a la(s) 11 30 20" src="https://github.com/Manriboy/masterIEBS/assets/156150473/846fda31-4a77-42cb-975d-830b72b18211">


En este primer extracto, se define la estructura de un "Objeto" que tendrá los atributos Nombre, Edad y si fuma o no. Después se definen las variables estilo mapping para en la siguiente función poder crear una persona con dichos atributos y marcar que se guardó el dato nuevo.

![Captura de pantalla 2024-03-06 a la(s) 21 31 17](https://github.com/Manriboy/masterIEBS/assets/156150473/272965db-7239-4b1b-a777-5937da7c9977)

Luego se crean dos (2) funciones donde se registra el nuevo individuo con los tres (3) atributos mencionados arriba y, en caso de que ya exista el registro, responder que ya fue creado.

![Captura de pantalla 2024-03-06 a la(s) 21 32 04](https://github.com/Manriboy/masterIEBS/assets/156150473/16455f2d-0fab-4936-a27a-c6491d900e9c)

Finalmente se crea la última función para traer los atributos de una persona ingresando su nombre. Esta será la función que posteriormente utilizará el contrato 2.

### Contrato 2: Sprint_1_Respuesta.sol

![Captura de pantalla 2024-03-06 a la(s) 21 34 04](https://github.com/Manriboy/masterIEBS/assets/156150473/1061bd2f-75a2-42b3-b38d-43a28f270497)

Al comienzo del código, se genera una interfaz de conexión para utilizar una función de otro contrato (get_datos)

![Captura de pantalla 2024-03-06 a la(s) 21 35 16](https://github.com/Manriboy/masterIEBS/assets/156150473/032cb88c-1709-477f-aa60-00fedb337dc3)

En la imagen anterior, se muestra la inicialización del contrato 2 y la llamada a la interfaz del contrato 1. En este caso, se pide la dirección del contrato 1 para saber donde ir a buscar la función correspondiente

![Captura de pantalla 2024-03-06 a la(s) 21 36 33](https://github.com/Manriboy/masterIEBS/assets/156150473/c0b0252d-63dd-4bce-afde-e3d786f3ebe4)

Por último, se muestra el cuerpo del contrato donde se define la función calculo. Esta función será la que, con los datos obtenidos de get_datos el contrato 1, hará el calculo de la expectativa de vida que tiene el individuo preguntado. En el cuerpo de la función se observa que, en caso de ser fumador, la espectativa de vida es 70 años menos la edad que ya tiene. Si no es fumador, son 90 menos los años que tiene. La multiplicación de 12 es para llevar el tiempo a meses (en Solidity no se puede utilizar la letra ñ de años). Para cerrar la imagen, se incluye la función unit2str para convertir el número entregado en un string y poder incluirlo en el mensaje.

## Respaldo de verificación y depliegue de los contratos

En la primera imagen a continuación, se muestra el respeldo en el despliegue del primero contrato

![Captura de pantalla 2024-03-06 a la(s) 21 45 30](https://github.com/Manriboy/masterIEBS/assets/156150473/e5f52815-3892-498d-a018-1d778e540cae)

Se puede observar el mensaje de release exitoso más los inputs y funciones que se pueden ejecutar el contrato en particular

![Captura de pantalla 2024-03-06 a la(s) 21 47 04](https://github.com/Manriboy/masterIEBS/assets/156150473/30990dcc-a591-4aa6-845f-384c3b2a88fa)

En esta segunda imagen, se muestra el contrato 2, también con el mensaje de despliegue exitoso, la única función calculo que tiene este contrato 2 y se destaca también el input de address donde, para desplegar un contrato que tiene un llamado a otro contrato, exige primero la dirección del contrato solicitado.

## Respaldo de contratos y transacciones en Etherscan

Primero se hace despliegue del contrato 1 utilizando una cuenta de prueba en Sepolia de mi Metamask personal

![Captura de pantalla 2024-03-06 a la(s) 22 01 43](https://github.com/Manriboy/masterIEBS/assets/156150473/e7cbbe08-3419-4539-ad28-ae61b0bd4b72)

A continuación se muestra como el contrato fue desplegado sin problemas con respaldos en Remix y en Etherscan

![Captura de pantalla 2024-03-06 a la(s) 22 03 22](https://github.com/Manriboy/masterIEBS/assets/156150473/2f308814-1d58-4506-ae25-1070c2f8f8b5)

![Captura de pantalla 2024-03-06 a la(s) 22 04 20](https://github.com/Manriboy/masterIEBS/assets/156150473/12550dd1-8bf9-4a4b-b14c-d2a02607f5a4)

https://sepolia.etherscan.io/tx/0x7506617951dfad5ba059e86a4d78febe73cf4c7ccde73ad12c9f1dc5e118e6ac

Ahora vienen los respaldos correspondientes al despliegue del contrato 2 en la misma red

![Captura de pantalla 2024-03-06 a la(s) 22 06 39](https://github.com/Manriboy/masterIEBS/assets/156150473/3f4ee8d0-2f29-4291-bb1b-768bafbb653d)

![Captura de pantalla 2024-03-06 a la(s) 22 07 19](https://github.com/Manriboy/masterIEBS/assets/156150473/82383c31-31b4-4074-b351-766a5bbe0a8e)

![Captura de pantalla 2024-03-06 a la(s) 22 07 38](https://github.com/Manriboy/masterIEBS/assets/156150473/04f6584a-9944-4942-b249-d8eaee6c0744)

https://sepolia.etherscan.io/tx/0x631322d5f08b09269de0ebcd00466cbd59aa5e06fb2d6c741596fb3c2b4f533b

Por último, se agregan algunas transacciones realizadas en ambos contratos con sus respaldos correspondientes

### Transacciones contrato 1

![Captura de pantalla 2024-03-06 a la(s) 22 08 36](https://github.com/Manriboy/masterIEBS/assets/156150473/353a4a3d-b2a1-435c-86fe-0704bae080ad)

![Captura de pantalla 2024-03-06 a la(s) 22 09 53](https://github.com/Manriboy/masterIEBS/assets/156150473/edbc2257-e30e-49a1-ab6b-c3a7e04c4955)

https://sepolia.etherscan.io/tx/0xa57baf4210a78771be8295010d1253dff210bbf57a457066cceb39d3ddcf04bf

![Captura de pantalla 2024-03-06 a la(s) 22 10 49](https://github.com/Manriboy/masterIEBS/assets/156150473/6d3810ee-235b-45b1-b0e0-79762b843dcb)

![Captura de pantalla 2024-03-06 a la(s) 22 11 34](https://github.com/Manriboy/masterIEBS/assets/156150473/64ca5dd4-83d7-4b1c-b615-4f93cc63fcaa)

https://sepolia.etherscan.io/tx/0x8d9541849ecfb0e542dab03028fd43bfc4052f557df4b87f7bfecdba47214b41

### Ejemplos de uso contrato 2

![Captura de pantalla 2024-03-06 a la(s) 22 14 18](https://github.com/Manriboy/masterIEBS/assets/156150473/3060096f-25d2-491b-8d0a-148944ac8755)

![Captura de pantalla 2024-03-06 a la(s) 22 15 06](https://github.com/Manriboy/masterIEBS/assets/156150473/15a08657-5ee5-42f8-b9f7-cb44943696f4)



