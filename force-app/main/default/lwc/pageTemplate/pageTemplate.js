import { LightningElement, wire } from 'lwc';
import { NavigationMixin, CurrentPageReference } from 'lightning/navigation';
import { getPagesConfigCallout } from 'c/spaConfig';

export default class PageTemplate extends NavigationMixin(LightningElement) {

    currentPageReference;
    pagesConfig;
    landingPage;

    currentPage;
    currentPageUrlParam;
    currentPageId;

    currentPageReferenceLoaded = false;
    pagesConfigLoaded = false;
    isLoaded = false;

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
        if (!currentPageReference) {
            return;
        }

        this.currentPageReference = currentPageReference;
        this.currentPageReferenceLoaded = true;

        this.init();
    }

    connectedCallback() {
        this.getPagesConfig();
    }

    async getPagesConfig() {
        this.pagesConfig = await getPagesConfigCallout();
        this.pagesConfigLoaded = true;

        this.init();
    }

    init() {
        if (!this.currentPageReferenceLoaded || !this.pagesConfigLoaded) {
            return;
        }

        this.setLandingPage();
        this.setCurrentPage();

        this.isLoaded = true;
    }

    setLandingPage() {
        if (this.isLandingPage) {
            return;
        }

        this.landingPage = this.pagesConfig.find(page => page.isLandingPage);
    }

    setCurrentPage() {
        this.currentPageUrlParam = this.currentPageReference?.state?.c__page || this.landingPage?.urlParam;
        this.currentPage = this.pagesConfig?.find(page => page.urlParam === this.currentPageUrlParam);
        this.currentPageId = this.currentPage?.pageId;
    }
}
