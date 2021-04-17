#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["ApiGateways/Mobile.Bff/WebAPI/Mobile.Bff.WebAPI.csproj", "ApiGateways/Mobile.Bff/WebAPI/"]
RUN dotnet restore "ApiGateways/Mobile.Bff/WebAPI/Mobile.Bff.WebAPI.csproj"
COPY . .
WORKDIR "/src/ApiGateways/Mobile.Bff/WebAPI"
RUN dotnet build "Mobile.Bff.WebAPI.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Mobile.Bff.WebAPI.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Mobile.Bff.WebAPI.dll"]