# AWS API Consumer

Este repositorio implementa un ejemplo de consumo del módulo reutilizable definido en el repositorio `lambda_api_module`. 

La infraestructura incluye:

- **Lambda**: Desplegada con una variable de entorno específica.
- **API Gateway**: Protegido con un autorizador Cognito.
- **WAF**: Configurado para bloquear direcciones IP específicas y limitar la tasa de solicitudes.
- **SNS**: Tópico configurado para notificar por correo electrónico en caso de eventos relevantes.