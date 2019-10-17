import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ConfigService {

  private readonly serverUrl = window.location.origin;

  constructor() {
    if (process.env.NODE_ENV === 'development') {
      this.serverUrl = 'http://localhost:8080';
    }
  }

  getServerUrl() {
    return this.serverUrl;
  }
}
