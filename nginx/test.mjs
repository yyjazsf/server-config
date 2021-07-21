#!/usr/bin/env zx


const rt =  parseInt(await nothrow($`ls -1 ${os.homedir()}/.nvm/.git | wc -l`))

// const rt = await fs.exists('$HOME/.nvm/.git')

console.log('rt',rt, rt > 0);

