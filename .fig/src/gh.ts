const completionSpec: Fig.Spec = {
  name: "gh",
  description: "",
  subcommands: [{
    name: "pr",
    subcommands: [{
      name: "create",
      options: [
        {
          name: '-r',
          args: {
          name: 'reviewer',
          generators: {
            script: "git get-remote-repo | xargs -I _ gh api repos/_/contributors --jq '.[].login' | cat",
            postProcess: function (contributors) {
              return contributors
                .split('\n')
                .filter(name => name !== 'petergoes')
                .map(name => ({ name, icon: '👤' }))
            }
          }
        }}
      ],
    }],
  }],
  options: [{
    name: ["--help", "-h"],
    description: "Show help for gh",
  }],
  // Only uncomment if gh takes an argument
  // args: {}
};
export default completionSpec;
