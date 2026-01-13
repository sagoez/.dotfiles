// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
	integrations: [
		starlight({
			title: 'Dotfiles',
			social: {
				github: 'https://github.com/sagoez/.dotfiles',
			},
			sidebar: [
				{
					label: 'Get Started',
					items: [
						// Each item here is one entry in the navigation menu.
						{ label: 'Install on Mac', slug: 'guides/install-on-mac' },
            { label: 'Install on Linux', slug: 'guides/install-on-linux' },
            { label: 'Folder Structure', slug: 'guides/folder-structure' },
					],
				}
			],
		}),
	],
});
