const completionSpec: Fig.Spec = {
  name: "git",
  subcommands: [
    {
      name: "checkout",
      options: [
        {
          name: "-b",
          args: {
            name: "New Branch",
            generators: {
              script: "cat .figenv",
              postProcess: function (out) {
                const hasContent = /No\ssuch\sfile/.test(out) === false
                let   [, prefix] =        hasContent &&  out.match(/^BRANCH_PREFIX=(.+)/m) || [null, '']
                const [, feature] =       hasContent &&  out.match(/^FEATURE=(.+)/m) || [null, 'feature']
                const [, fix] =           hasContent &&  out.match(/^FIX=(.+)/m) || [null, 'fix']
                const [, hotfix] =        hasContent &&  out.match(/^HOTFIX=(.+)/m) || [null, 'hotfix']
                const [, refactor] =      hasContent &&  out.match(/^REFACTOR=(.+)/m) || [null, 'refactor']
                const [, documentation] = hasContent &&  out.match(/^DOCUMENTATION=(.+)/m) || [null, 'docs']
                const [, test] =          hasContent &&  out.match(/^TEST=(.+)/m) || [null, 'test']
                const [, release] =       hasContent &&  out.match(/^RELEASE=(.+)/m) || [null, 'release']
                const [, chore] =         hasContent &&  out.match(/^CHORE=(.+)/m) || [null, 'chore']

                prefix = prefix.toUpperCase()

                return [
                  {
                    name: "Feature",
                    insertValue: `${feature}/${prefix}`,
                    icon: "💫",
                    description: `Start a Feature branch. (${feature}/${prefix})`,
                  },
                  {
                    name: "Fix",
                    insertValue: `${fix}/${prefix}`,
                    icon: "🪲",
                    description: `Start a Fix branch. (${fix}/${prefix})`,
                  },
                  {
                    name: "Hotfix",
                    insertValue: `${hotfix}/${prefix}`,
                    icon: "🐞",
                    description: `Start a Hotfix branch. (${hotfix}/${prefix})`,
                  },
                  {
                    name: "Refactor",
                    insertValue: `${refactor}/${prefix}`,
                    icon: "🏗",
                    description: `Start a Refactor branch. (${refactor}/${prefix})`,
                  },
                  {
                    name: "Documentation",
                    insertValue: `${documentation}/${prefix}`,
                    icon: "📝",
                    description: `Start a Documentation branch. (${documentation}/${prefix})`,
                  },
                  {
                    name: "Test",
                    insertValue: `${test}/${prefix}`,
                    icon: "🧪",
                    description: `Start a Test branch. (${test}/${prefix})`,
                  },
                  {
                    name: "Release",
                    insertValue: `${release}/${prefix}`,
                    icon: "📦",
                    description: `Start a Release branch. (${release}/${prefix})`,
                  },
                  {
                    name: "Chore",
                    insertValue: `${chore}/${prefix}`,
                    icon: "🧹",
                    description: `Start a Chore branch. (${chore}/${prefix})`,
                  },
                ];
              },
            },
          },
        },
      ],
    },
    {
      name: "prune-local",
      description: "Remove local branches without upstream counterpart",
    },
    {
      name: "pull-on",
      description: "",
      args: {
        name: "branch",
        generators: {
          script: "git branch -l",
          postProcess: function (out) {
            return out.split("\n").map((branch) => {
              const isMain =
                branch.trim() === "main" || branch.trim() === "master";

              return {
                name: branch,
                description: `Branch to pull`,
                icon: "fig://icon?type=git",
                priority: isMain ? 100 : 50,
              };
            });
          },
        },
      },
    },
    {
      name: "remove-branches",
      options: [{ name: "-f" }],
    },
    {
      name: "current-branch",
      description: 'Show the current branch'
    },
  ],
};
export default completionSpec;
