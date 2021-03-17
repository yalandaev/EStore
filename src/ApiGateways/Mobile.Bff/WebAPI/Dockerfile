FROM mcr.microsoft.com/dotnet/aspnet:5.0-focal AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0-focal AS build
ARG Version=0.0.1.0
WORKDIR /src
COPY . .
WORKDIR "./src/WebAPI"
RUN dotnet build "Mobile.Bff.WebAPI.csproj" -c Release -o /app/build -p:Version=$Version

FROM build AS publish
ARG Version=0.0.1.0
RUN dotnet publish "Mobile.Bff.WebAPI.csproj" -c Release -o /app/publish -p:Version=$Version

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Mobile.Bff.WebAPI.dll"]
