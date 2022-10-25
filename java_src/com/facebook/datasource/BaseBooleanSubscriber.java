package com.facebook.datasource;
/* loaded from: classes.dex */
public abstract class BaseBooleanSubscriber implements DataSubscriber<Boolean> {
    protected abstract void onFailureImpl(DataSource<Boolean> dataSource);

    protected abstract void onNewResultImpl(boolean z);

    @Override // com.facebook.datasource.DataSubscriber
    public void onNewResult(DataSource<Boolean> dataSource) {
        try {
            onNewResultImpl(dataSource.mo479getResult().booleanValue());
        } finally {
            dataSource.close();
        }
    }

    @Override // com.facebook.datasource.DataSubscriber
    public void onFailure(DataSource<Boolean> dataSource) {
        try {
            onFailureImpl(dataSource);
        } finally {
            dataSource.close();
        }
    }

    @Override // com.facebook.datasource.DataSubscriber
    public void onCancellation(DataSource<Boolean> dataSource) {
    }

    @Override // com.facebook.datasource.DataSubscriber
    public void onProgressUpdate(DataSource<Boolean> dataSource) {
    }
}
