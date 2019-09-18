package edu.berkeley.gpporgs.exception;

import graphql.ErrorType;
import graphql.ExceptionWhileDataFetching;
import graphql.GraphQLError;
import graphql.language.SourceLocation;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public class GraphQLErrorAdapter implements GraphQLError {

    @Autowired
    private GraphQLError graphQLError;

    @Override
    public Map<String, Object> getExtensions() {
        return graphQLError.getExtensions();
    }

    @Override
    public List<SourceLocation> getLocations() {
        return graphQLError.getLocations();
    }

    @Override
    public ErrorType getErrorType() {
        return graphQLError.getErrorType();
    }

    @Override
    public List<Object> getPath() {
        return graphQLError.getPath();
    }

    @Override
    public Map<String, Object> toSpecification() {
        return graphQLError.toSpecification();
    }

    @Override
    public String getMessage() {
        return (graphQLError instanceof ExceptionWhileDataFetching) ? ((ExceptionWhileDataFetching) graphQLError).getException().getMessage() : graphQLError.getMessage();
    }
}
