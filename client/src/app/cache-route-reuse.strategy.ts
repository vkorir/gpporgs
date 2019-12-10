import { DetachedRouteHandle, RouteReuseStrategy, ActivatedRouteSnapshot } from '@angular/router';

export class CacheRouteReuseStrategy implements RouteReuseStrategy {

  storedRouteHandles = new Map<string, DetachedRouteHandle>();
  allowRetrieveCache = {
    home: true,
    admin: true
  };

  shouldReuseRoute(before: ActivatedRouteSnapshot, curr: ActivatedRouteSnapshot): boolean {
    if (this.getPath(before) === 'admin' && this.getPath(curr) === 'home') {
      this.allowRetrieveCache.home = true;
    } else if (this.getPath(before) === 'home' && this.getPath(curr) === 'admin') {
      this.allowRetrieveCache.admin = true;
    } else {
      this.allowRetrieveCache.home = false;
      this.allowRetrieveCache.admin = false;
    }
    return before.routeConfig === curr.routeConfig;
  }

  retrieve(route: ActivatedRouteSnapshot): DetachedRouteHandle | null {
    return this.storedRouteHandles.get(this.getPath(route)) as DetachedRouteHandle;
  }

  shouldAttach(route: ActivatedRouteSnapshot): boolean {
    const path = this.getPath(route);
    if (this.allowRetrieveCache[path]) {
      return this.storedRouteHandles.has(path);
    }
    return false;
  }

  shouldDetach(route: ActivatedRouteSnapshot): boolean {
    const path = this.getPath(route);
    if (this.allowRetrieveCache.hasOwnProperty(path)) {
      return true;
    }
    return false;
  }

  store(route: ActivatedRouteSnapshot, detachedTree: DetachedRouteHandle): void {
    this.storedRouteHandles.set(this.getPath(route), detachedTree);
  }

  private getPath(route: ActivatedRouteSnapshot): string {
    if (route.routeConfig !== null && route.routeConfig.path !== null) {
      return route.routeConfig.path ? route.routeConfig.path : 'home';
    }
    return '';
  }
}
