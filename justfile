# Install dependencies
install:
    uv sync

# Install with dev dependencies
install-dev:
    uv sync --all-groups

# Run tests
test:
    uv run pytest

# Run tests with coverage
test-cov:
    uv run pytest --cov=src --cov-report=term-missing --cov-report=html

# Format code
format:
    uv run black src tests
    uv run isort src tests

# Check formatting
format-check:
    uv run black --check src tests
    uv run isort --check src tests

# Run linter
lint:
    uv run black --check src tests
    uv run isort --check src tests

# Clean build artifacts
clean:
    rm -rf build/
    rm -rf dist/
    rm -rf *.egg-info
    rm -rf .pytest_cache
    rm -rf .coverage
    rm -rf htmlcov/
    find . -type d -name __pycache__ -exec rm -rf {} +
    find . -type f -name "*.pyc" -delete

# Build package
build:
    uv build

# Show available commands
help:
    @just --list
