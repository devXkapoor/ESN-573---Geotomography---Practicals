% Example usage
A = [3 2; 2 6];
b = [2; -8];
x0 = [0; 0];
tol = 1e-6;
max_iter = 1000;

[x_opt, fval, iterations] = steepest_descent(A, b, x0, tol, max_iter);

fprintf('Optimal solution: x = [%f, %f], f(x) = %f\n', x_opt(1), x_opt(2), fval);



function [x, fval, iter] = steepest_descent(A, b, x0, tol, max_iter)
    % Function to minimize f(x) = 0.5*x'*A*x - b'*x using Steepest Descent Method
    % A: Symmetric positive definite matrix
    % b: Vector
    % x0: Initial guess
    % tol: Tolerance for convergence
    % max_iter: Maximum number of iterations
    
    % Initialize
    x = x0;
    iter = 0;
    
    % Gradient of the function
    grad_f = @(x) A*x - b;
    
    while norm(grad_f(x)) > tol && iter < max_iter
        % Calculate gradient
        g = grad_f(x);
        
        % Line search for optimal step size (exact line search)
        alpha = (g'*g) / (g'*A*g);
        
        % Update x
        x = x - alpha * g;
        
        % Increment iteration counter
        iter = iter + 1;
        
        % Display progress
        fprintf('Iteration %d: x = [%f, %f], f(x) = %f\n', iter, x(1), x(2), 0.5*x'*A*x - b'*x);
    end
    
    % Final function value
    fval = 0.5*x'*A*x - b'*x;
    
    if iter == max_iter
        fprintf('Maximum iterations reached. Solution may not be optimal.\n');
    else
        fprintf('Converged to a solution in %d iterations.\n', iter);
    end
end
