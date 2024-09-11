@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("{id}")
    public User getUser(@PathVariable Long id){
        return userService.getUserById(id)
                .orElseThrow(() -> new UserNotFoundException(id, "/api/users"));
    }

    @PostMapping
    public User createUser(@Valid @RequestBody User user) {
        return userService.createUser(user);
    }
}