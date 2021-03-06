@ECHO OFF

SET IDCS_URL=https://idcs-0ce80554741a401f97a171066cbd6114.identity.oraclecloud.com
SET IDCS_CLIENT_ID=4c6b1858085b4025a490f3c76dc5fd17
SET IDCS_CLIENT_SECRET=b9bc5644-9855-4b46-873e-20a8a2d1e4ce

REM if you want to use the app to do self registration uncomment line
REM and include the ID of a self registration profile here:
REM SET IDCS_SELFREGPROFILES=1234567890abcd1234567890abcdef12

REM setting DEBUG_LOGIN to true will enable logging both in node.js and
REM in your web browser's JavaScript console.
REM this setting is intended for development and debugging purposes and shouldn't
REM be turned on in production
REM SET DEBUG_LOGIN=true

REM Setting NODE_ENV to "production" disables printing stack traces of any exceptions
REM to the user's browser.
REM If you want to change that for development purposes then comment this line.
REM
REM WARNING: When using this in production you should always have NODE_ENV=production
SET NODE_ENV=production


WHERE >nul 2>nul npm
IF %ERRORLEVEL% NEQ 0 (
  echo ERROR: Node.js not installed
) ELSE (
  IF NOT EXIST ".\node_modules" (
    echo INFO: Required node.js modules are missing! Installing them now...
    npm install
    IF ERRORLEVEL 1 (
      IF EXIST ".\node_modules" RMDIR /S /Q .\node_modules
      ECHO ERROR: npm cannot get the required node.js modules!
      ECHO ERROR: If you need a proxy to reach the internet configure npm to use it with:
      ECHO ERROR:   npm config set proxy="<proxy_url>"
      ECHO ERROR:   npm config set https-proxy="<proxy_url>"
    )
  )

  IF NOT ERRORLEVEL 1 npm start
)
