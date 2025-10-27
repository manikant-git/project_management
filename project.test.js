function escapeHtml(str){
  return str.replace(/[&<>"']/g, m => ({
    '&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":""
  }[m]));
}

function isValidProject(name, desc) {
  return (name.length >= 3 && desc.length >= 10);
}

function createProject(name, desc, status) {
  if (!isValidProject(name, desc)) {
    throw new Error("Validation Error");
  }
  return {
    id: 12345,
    name: escapeHtml(name),
    desc: escapeHtml(desc),
    status,
    created: "2025-10-27 12:00"
  };
}

describe('Project Management Web App', () => {

  test('escapeHtml should escape HTML tags and chars', () => {
    expect(escapeHtml('<script>alert("A") &</script>\'')).toBe('&lt;script&gt;alert(&quot;A&quot;) &amp;&lt;/script&gt;');
  });

  test('isValidProject should validate project name and description length', () => {
    expect(isValidProject('Proj', 'A good description')).toBe(true);
    expect(isValidProject('Pr', 'A good description')).toBe(false);
    expect(isValidProject('Good', 'Short')).toBe(false);
  });

  test('createProject should create a project with valid values and escape fields', () => {
    const proj = createProject('<Alpha>', 'Great <desc> for proj & testing!', 'Active');
    expect(proj.name).toBe('&lt;Alpha&gt;');
    expect(proj.desc).toBe('Great &lt;desc&gt; for proj &amp; testing!');
    expect(proj.status).toBe('Active');
    expect(proj.created).toBeDefined();
    expect(typeof proj.id).toBe("number" || "string");
  });

  test('createProject should throw error for validation failure', () => {
    expect(() => createProject('AB', 'Short', 'Inactive')).toThrow('Validation Error');
  });

});
