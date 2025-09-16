@echo off
REM Caminho para o WildFly e o projeto
set WILDFLY_HOME=${WILDFLY_PATH}
set PROJECT_HOME=${PROJECT_PATH}

REM Configurar o Java 8 para o WildFly
set JAVA_HOME=${JAVA_HOME}
set PATH=${JAVA_PATH}

REM Copiar o arquivo WAR para a pasta de deployments do WildFly
xcopy /Y %PROJECT_HOME%\servidor\target\registrocontrato.war %WILDFLY_HOME%\standalone\deployments\

REM Habilitar o debug no WildFly na porta 8787
set "JAVA_OPTS=-agentlib:jdwp=transport=dt_socket,address=8787,server=y,suspend=y"

REM Iniciar o WildFly sem abrir uma nova janela
cd %WILDFLY_HOME%\bin
REM Rodar diretamente no terminal, sem 'start', para manter no terminal integrado
standalone.bat -c standalone-full.xml
timeout /t 5 > nul