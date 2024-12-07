plugins {
    kotlin("jvm") version "2.0.0"
}

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(kotlin("test"))
    implementation(kotlin("stdlib"))
}

tasks.test {
    useJUnitPlatform()
}

