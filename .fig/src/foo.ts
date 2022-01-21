const completionSpec: Fig.Spec = {
  name: "foo",
  description: "Navigate to a marked folder",
  args: {
    name: "mark",
    generators: {
      script: "ls ~/.marks",
      postProcess: function (out) {
        return out.split("\n").map((mark) => {
          return { name: mark, description: `Jump to ${mark}`, icon: "➡️" };
        });
      },
    },
  },
};
export default completionSpec;
