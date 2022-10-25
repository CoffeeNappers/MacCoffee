package me.grishka.appkit.fragments;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes3.dex */
public class ContainerFragment extends AppKitFragment {
    private InnerFragmentManager innerFragmentManager;
    private ArrayList<Runnable> runQueue = new ArrayList<>();
    private boolean activityCreated = false;
    private ArrayList<Fragment> children = new ArrayList<>();
    private boolean detached = false;

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        this.activityCreated = true;
        this.detached = false;
        Handler handler = new Handler();
        Iterator<Runnable> it = this.runQueue.iterator();
        while (it.hasNext()) {
            Runnable r = it.next();
            handler.post(r);
        }
        this.runQueue.clear();
    }

    public FragmentManager getInnerFragmentManager() {
        if (Build.VERSION.SDK_INT >= 17) {
            return getChildFragmentManager();
        }
        if (this.innerFragmentManager == null) {
            this.innerFragmentManager = new InnerFragmentManager(getFragmentManager());
        }
        return this.innerFragmentManager;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDetach() {
        if (isRemoving()) {
            Iterator<Fragment> it = this.children.iterator();
            while (it.hasNext()) {
                Fragment f = it.next();
                getFragmentManager().beginTransaction().remove(f).commit();
            }
            this.detached = true;
        }
        super.onDetach();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class InnerFragmentManager extends FragmentManager {
        private FragmentManager o;

        public InnerFragmentManager(FragmentManager orig) {
            this.o = orig;
        }

        @Override // android.app.FragmentManager
        public void addOnBackStackChangedListener(FragmentManager.OnBackStackChangedListener arg0) {
            this.o.addOnBackStackChangedListener(arg0);
        }

        @Override // android.app.FragmentManager
        public FragmentTransaction beginTransaction() {
            return new InnerFragmentTransaction(ContainerFragment.this.getFragmentManager().beginTransaction());
        }

        @Override // android.app.FragmentManager
        public void dump(String arg0, FileDescriptor arg1, PrintWriter arg2, String[] arg3) {
            this.o.dump(arg0, arg1, arg2, arg3);
        }

        @Override // android.app.FragmentManager
        public boolean executePendingTransactions() {
            return this.o.executePendingTransactions();
        }

        @Override // android.app.FragmentManager
        public Fragment findFragmentById(int arg0) {
            return this.o.findFragmentById(arg0);
        }

        @Override // android.app.FragmentManager
        public Fragment findFragmentByTag(String arg0) {
            return this.o.findFragmentByTag(arg0 + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + ContainerFragment.this.getClass().getName());
        }

        @Override // android.app.FragmentManager
        public FragmentManager.BackStackEntry getBackStackEntryAt(int arg0) {
            return this.o.getBackStackEntryAt(arg0);
        }

        @Override // android.app.FragmentManager
        public int getBackStackEntryCount() {
            return this.o.getBackStackEntryCount();
        }

        @Override // android.app.FragmentManager
        public Fragment getFragment(Bundle arg0, String arg1) {
            return this.o.getFragment(arg0, arg1);
        }

        @Override // android.app.FragmentManager
        public void popBackStack() {
            this.o.popBackStack();
        }

        @Override // android.app.FragmentManager
        public void popBackStack(String arg0, int arg1) {
            this.o.popBackStack(arg0, arg1);
        }

        @Override // android.app.FragmentManager
        public void popBackStack(int arg0, int arg1) {
            this.o.popBackStack(arg0, arg1);
        }

        @Override // android.app.FragmentManager
        public boolean popBackStackImmediate() {
            return this.o.popBackStackImmediate();
        }

        @Override // android.app.FragmentManager
        public boolean popBackStackImmediate(String arg0, int arg1) {
            return this.o.popBackStackImmediate(arg0, arg1);
        }

        @Override // android.app.FragmentManager
        public boolean popBackStackImmediate(int arg0, int arg1) {
            return this.o.popBackStackImmediate(arg0, arg1);
        }

        @Override // android.app.FragmentManager
        public void putFragment(Bundle arg0, String arg1, Fragment arg2) {
            this.o.putFragment(arg0, arg1, arg2);
        }

        @Override // android.app.FragmentManager
        public void removeOnBackStackChangedListener(FragmentManager.OnBackStackChangedListener arg0) {
            this.o.removeOnBackStackChangedListener(arg0);
        }

        @Override // android.app.FragmentManager
        public Fragment.SavedState saveFragmentInstanceState(Fragment arg0) {
            return this.o.saveFragmentInstanceState(arg0);
        }

        @Override // android.app.FragmentManager
        public boolean isDestroyed() {
            return false;
        }
    }

    /* loaded from: classes3.dex */
    private class InnerFragmentTransaction extends FragmentTransaction {
        private ArrayList<Fragment> fragmentsToAdd = new ArrayList<>();
        private ArrayList<Fragment> fragmentsToRemove = new ArrayList<>();
        private FragmentTransaction o;

        public InnerFragmentTransaction(FragmentTransaction orig) {
            this.o = orig;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction add(Fragment fragment, String tag) {
            this.o.add(fragment, tag + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + ContainerFragment.this.getClass().getName());
            this.fragmentsToAdd.add(fragment);
            return this;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction add(int containerID, Fragment fragment) {
            this.o.add(containerID, fragment);
            this.fragmentsToAdd.add(fragment);
            return this;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction add(int containerID, Fragment fragment, String tag) {
            if (!ContainerFragment.this.detached) {
                this.o.add(containerID, fragment, tag + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + ContainerFragment.this.getClass().getName());
                this.fragmentsToAdd.add(fragment);
            }
            return this;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction addToBackStack(String arg0) {
            throw new UnsupportedOperationException("Back stack not supported for inner fragments");
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction attach(Fragment fragment) {
            if (!ContainerFragment.this.detached) {
                this.o.attach(fragment);
                this.fragmentsToAdd.add(fragment);
            }
            return this;
        }

        @Override // android.app.FragmentTransaction
        public int commit() {
            if (!ContainerFragment.this.activityCreated) {
                ContainerFragment.this.runQueue.add(new Runnable() { // from class: me.grishka.appkit.fragments.ContainerFragment.InnerFragmentTransaction.1
                    @Override // java.lang.Runnable
                    public void run() {
                        InnerFragmentTransaction.this.o.commit();
                        ContainerFragment.this.children.addAll(InnerFragmentTransaction.this.fragmentsToAdd);
                        ContainerFragment.this.children.removeAll(InnerFragmentTransaction.this.fragmentsToRemove);
                    }
                });
                return -1;
            }
            this.o.commit();
            ContainerFragment.this.children.addAll(this.fragmentsToAdd);
            ContainerFragment.this.children.removeAll(this.fragmentsToRemove);
            return -1;
        }

        @Override // android.app.FragmentTransaction
        public int commitAllowingStateLoss() {
            if (!ContainerFragment.this.activityCreated) {
                ContainerFragment.this.runQueue.add(new Runnable() { // from class: me.grishka.appkit.fragments.ContainerFragment.InnerFragmentTransaction.2
                    @Override // java.lang.Runnable
                    public void run() {
                        InnerFragmentTransaction.this.o.commitAllowingStateLoss();
                        ContainerFragment.this.children.addAll(InnerFragmentTransaction.this.fragmentsToAdd);
                        ContainerFragment.this.children.removeAll(InnerFragmentTransaction.this.fragmentsToRemove);
                    }
                });
                return -1;
            }
            this.o.commitAllowingStateLoss();
            ContainerFragment.this.children.addAll(this.fragmentsToAdd);
            ContainerFragment.this.children.removeAll(this.fragmentsToRemove);
            return -1;
        }

        @Override // android.app.FragmentTransaction
        public void commitNow() {
            commit();
        }

        @Override // android.app.FragmentTransaction
        public void commitNowAllowingStateLoss() {
            commitAllowingStateLoss();
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction detach(Fragment fragment) {
            this.fragmentsToRemove.add(fragment);
            return this.o.detach(fragment);
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction disallowAddToBackStack() {
            throw new UnsupportedOperationException("Back stack not supported for inner fragments");
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction hide(Fragment fragment) {
            this.o.hide(fragment);
            return this;
        }

        @Override // android.app.FragmentTransaction
        public boolean isAddToBackStackAllowed() {
            throw new UnsupportedOperationException("Back stack not supported for inner fragments");
        }

        @Override // android.app.FragmentTransaction
        public boolean isEmpty() {
            return this.o.isEmpty();
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction remove(Fragment fragment) {
            this.o.remove(fragment);
            this.fragmentsToRemove.add(fragment);
            return this;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction replace(int containerID, Fragment fragment) {
            this.o.replace(containerID, fragment);
            return this;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction replace(int containerID, Fragment fragment, String tag) {
            this.o.replace(containerID, fragment, tag + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + ContainerFragment.this.getClass().getName());
            return this;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction setBreadCrumbShortTitle(int title) {
            this.o.setBreadCrumbShortTitle(title);
            return this;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction setBreadCrumbShortTitle(CharSequence title) {
            this.o.setBreadCrumbShortTitle(title);
            return this;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction setBreadCrumbTitle(int title) {
            this.o.setBreadCrumbTitle(title);
            return this;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction setBreadCrumbTitle(CharSequence title) {
            this.o.setBreadCrumbTitle(title);
            return this;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction setCustomAnimations(int arg0, int arg1) {
            this.o.setCustomAnimations(arg0, arg1);
            return this;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction setCustomAnimations(int arg0, int arg1, int arg2, int arg3) {
            this.o.setCustomAnimations(arg0, arg1, arg2, arg3);
            return this;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction setTransition(int arg0) {
            this.o.setTransition(arg0);
            return this;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction addSharedElement(View view, String s) {
            return null;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction setTransitionStyle(int arg0) {
            this.o.setTransitionStyle(arg0);
            return this;
        }

        @Override // android.app.FragmentTransaction
        public FragmentTransaction show(Fragment fragment) {
            this.o.show(fragment);
            return this;
        }
    }
}
