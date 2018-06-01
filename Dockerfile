# builder
FROM microsoft/dotnet:2.1-sdk AS builder

ENV PublishWithAspNetCoreTargetManifest false

COPY . /runtime
WORKDIR /runtime

RUN dotnet build WebJobs.Script.sln
RUN dotnet publish src/WebJobs.Script.WebHost/WebJobs.Script.WebHost.csproj --output /azure-functions-runtime

# runner
FROM microsoft/dotnet:2.1-runtime

RUN apt-get update --yes
RUN apt-get install --yes gnupg
RUN curl --silent --location https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install --yes nodejs

COPY --from=builder ["/azure-functions-runtime", "/azure-functions-runtime"]

ENV AzureWebJobsScriptRoot=/app

CMD ["dotnet", "/azure-functions-runtime/Microsoft.Azure.WebJobs.Script.WebHost.dll"]
