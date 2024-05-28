import React from "react";
import Navigation from "./Navigation";
import { IonContent, IonPage } from "@ionic/react";

const Layout: React.FC<{ children: React.ReactNode; active: string }> = ({
  children,
  active,
}) => {
  return (
    <IonPage>
      <IonContent fullscreen>
        <div className="bg-black text-black flex justify-center mx-auto max-w-screen-sm">
          <div className="w-full min-h-screen h-full bg-white px-2 py-3 flex flex-col justify-between pb-20">
            {children}
            <Navigation active={active} />
          </div>
        </div>
      </IonContent>
    </IonPage>
  );
};

export default Layout;
