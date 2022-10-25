package io.reactivex.disposables;

import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.DisposableContainer;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.internal.util.OpenHashSet;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public final class CompositeDisposable implements Disposable, DisposableContainer {
    volatile boolean disposed;
    OpenHashSet<Disposable> resources;

    public CompositeDisposable() {
    }

    public CompositeDisposable(Disposable... resources) {
        ObjectHelper.requireNonNull(resources, "resources is null");
        this.resources = new OpenHashSet<>(resources.length + 1);
        for (Disposable d : resources) {
            ObjectHelper.requireNonNull(d, "Disposable item is null");
            this.resources.add(d);
        }
    }

    public CompositeDisposable(Iterable<? extends Disposable> resources) {
        ObjectHelper.requireNonNull(resources, "resources is null");
        this.resources = new OpenHashSet<>();
        for (Disposable d : resources) {
            ObjectHelper.requireNonNull(d, "Disposable item is null");
            this.resources.add(d);
        }
    }

    @Override // io.reactivex.disposables.Disposable
    public void dispose() {
        if (!this.disposed) {
            synchronized (this) {
                if (!this.disposed) {
                    this.disposed = true;
                    OpenHashSet<Disposable> set = this.resources;
                    this.resources = null;
                    dispose(set);
                }
            }
        }
    }

    @Override // io.reactivex.disposables.Disposable
    public boolean isDisposed() {
        return this.disposed;
    }

    @Override // io.reactivex.internal.disposables.DisposableContainer
    public boolean add(Disposable d) {
        ObjectHelper.requireNonNull(d, "d is null");
        if (!this.disposed) {
            synchronized (this) {
                if (!this.disposed) {
                    OpenHashSet<Disposable> set = this.resources;
                    if (set == null) {
                        set = new OpenHashSet<>();
                        this.resources = set;
                    }
                    set.add(d);
                    return true;
                }
            }
        }
        d.dispose();
        return false;
    }

    public boolean addAll(Disposable... ds) {
        ObjectHelper.requireNonNull(ds, "ds is null");
        if (!this.disposed) {
            synchronized (this) {
                if (!this.disposed) {
                    OpenHashSet<Disposable> set = this.resources;
                    if (set == null) {
                        set = new OpenHashSet<>(ds.length + 1);
                        this.resources = set;
                    }
                    for (Disposable d : ds) {
                        ObjectHelper.requireNonNull(d, "d is null");
                        set.add(d);
                    }
                    return true;
                }
            }
        }
        for (Disposable d2 : ds) {
            d2.dispose();
        }
        return false;
    }

    @Override // io.reactivex.internal.disposables.DisposableContainer
    public boolean remove(Disposable d) {
        if (delete(d)) {
            d.dispose();
            return true;
        }
        return false;
    }

    @Override // io.reactivex.internal.disposables.DisposableContainer
    public boolean delete(Disposable d) {
        boolean z = false;
        ObjectHelper.requireNonNull(d, "Disposable item is null");
        if (!this.disposed) {
            synchronized (this) {
                if (!this.disposed) {
                    OpenHashSet<Disposable> set = this.resources;
                    if (set != null && set.remove(d)) {
                        z = true;
                    }
                }
            }
        }
        return z;
    }

    public void clear() {
        if (!this.disposed) {
            synchronized (this) {
                if (!this.disposed) {
                    OpenHashSet<Disposable> set = this.resources;
                    this.resources = null;
                    dispose(set);
                }
            }
        }
    }

    public int size() {
        int i = 0;
        if (!this.disposed) {
            synchronized (this) {
                if (!this.disposed) {
                    OpenHashSet<Disposable> set = this.resources;
                    if (set != null) {
                        i = set.size();
                    }
                }
            }
        }
        return i;
    }

    void dispose(OpenHashSet<Disposable> set) {
        if (set != null) {
            List<Throwable> errors = null;
            Object[] array = set.keys();
            for (Object o : array) {
                if (o instanceof Disposable) {
                    try {
                        ((Disposable) o).dispose();
                    } catch (Throwable ex) {
                        Exceptions.throwIfFatal(ex);
                        if (errors == null) {
                            errors = new ArrayList<>();
                        }
                        errors.add(ex);
                    }
                }
            }
            if (errors != null) {
                if (errors.size() == 1) {
                    throw ExceptionHelper.wrapOrThrow(errors.get(0));
                }
                throw new CompositeException(errors);
            }
        }
    }
}
