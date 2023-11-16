FROM mcr.microsoft.com/dotnet/sdk:8.0.100-jammy AS restore-setup
WORKDIR /CSharpierTest
COPY ["Directory.Packages.props", "."]
COPY ["global.json", "."]

COPY ["./", "./"]

FROM restore-setup AS restore
RUN dotnet restore "CSharpierTest.csproj"

FROM restore AS build
RUN dotnet build "CSharpierTest.csproj" -c Release --no-restore