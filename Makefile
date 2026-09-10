PACKAGE := com.example.q012
IMAGE := quantum-key-lease

.PHONY: test build run

test:
	rm -rf build && mkdir -p build/classes
	javac --add-modules jdk.httpserver -d build/classes $$(find src -name '*.java')
	java --add-modules jdk.httpserver -cp build/classes $(PACKAGE).HealthTest

build:
	docker build -t $(IMAGE) .

run:
	docker run --rm -p 8312:8312 $(IMAGE)
