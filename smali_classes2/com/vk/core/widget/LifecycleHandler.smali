.class public Lcom/vk/core/widget/LifecycleHandler;
.super Landroid/app/Fragment;
.source "LifecycleHandler.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;
    }
.end annotation


# static fields
.field private static final FRAGMENT_TAG:Ljava/lang/String; = "LifecycleHandler"

.field private static final KEY_ACTIVITY_REQUEST_CODES:Ljava/lang/String; = "LifecycleHandler.activityRequests"

.field private static final KEY_PENDING_PERMISSION_REQUESTS:Ljava/lang/String; = "LifecycleHandler.pendingPermissionRequests"

.field private static final KEY_PERMISSION_REQUEST_CODES:Ljava/lang/String; = "LifecycleHandler.permissionRequests"


# instance fields
.field private activity:Landroid/app/Activity;

.field private activityRequestMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private attached:Z

.field private destroyed:Z

.field private hasRegisteredCallbacks:Z

.field private lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

.field private pendingPermissionRequests:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;",
            ">;"
        }
    .end annotation
.end field

.field private permissionRequestMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 42
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 36
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->permissionRequestMap:Landroid/util/SparseArray;

    .line 37
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->activityRequestMap:Landroid/util/SparseArray;

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->pendingPermissionRequests:Ljava/util/ArrayList;

    .line 43
    invoke-virtual {p0, v1}, Lcom/vk/core/widget/LifecycleHandler;->setRetainInstance(Z)V

    .line 44
    invoke-virtual {p0, v1}, Lcom/vk/core/widget/LifecycleHandler;->setHasOptionsMenu(Z)V

    .line 45
    return-void
.end method

.method private destroyRouters()V
    .locals 2

    .prologue
    .line 160
    iget-boolean v0, p0, Lcom/vk/core/widget/LifecycleHandler;->destroyed:Z

    if-nez v0, :cond_0

    .line 161
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/core/widget/LifecycleHandler;->destroyed:Z

    .line 163
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    iget-object v1, p0, Lcom/vk/core/widget/LifecycleHandler;->activity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/vk/core/widget/LifecycleListener;->onActivityDestroyed(Landroid/app/Activity;)V

    .line 169
    :cond_0
    return-void
.end method

.method private static findInActivity(Landroid/app/Activity;)Lcom/vk/core/widget/LifecycleHandler;
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 49
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string/jumbo v2, "LifecycleHandler"

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/vk/core/widget/LifecycleHandler;

    .line 50
    .local v0, "lifecycleHandler":Lcom/vk/core/widget/LifecycleHandler;
    if-eqz v0, :cond_0

    .line 51
    invoke-direct {v0, p0}, Lcom/vk/core/widget/LifecycleHandler;->registerActivityListener(Landroid/app/Activity;)V

    .line 53
    :cond_0
    return-object v0
.end method

.method public static install(Landroid/app/Activity;)Lcom/vk/core/widget/LifecycleHandler;
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 58
    invoke-static {p0}, Lcom/vk/core/widget/LifecycleHandler;->findInActivity(Landroid/app/Activity;)Lcom/vk/core/widget/LifecycleHandler;

    move-result-object v0

    .line 59
    .local v0, "lifecycleHandler":Lcom/vk/core/widget/LifecycleHandler;
    if-nez v0, :cond_0

    .line 60
    new-instance v0, Lcom/vk/core/widget/LifecycleHandler;

    .end local v0    # "lifecycleHandler":Lcom/vk/core/widget/LifecycleHandler;
    invoke-direct {v0}, Lcom/vk/core/widget/LifecycleHandler;-><init>()V

    .line 61
    .restart local v0    # "lifecycleHandler":Lcom/vk/core/widget/LifecycleHandler;
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    const-string/jumbo v2, "LifecycleHandler"

    invoke-virtual {v1, v0, v2}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    .line 63
    :cond_0
    invoke-direct {v0, p0}, Lcom/vk/core/widget/LifecycleHandler;->registerActivityListener(Landroid/app/Activity;)V

    .line 64
    return-object v0
.end method

.method private registerActivityListener(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 81
    iput-object p1, p0, Lcom/vk/core/widget/LifecycleHandler;->activity:Landroid/app/Activity;

    .line 83
    iget-boolean v0, p0, Lcom/vk/core/widget/LifecycleHandler;->hasRegisteredCallbacks:Z

    if-nez v0, :cond_0

    .line 84
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/core/widget/LifecycleHandler;->hasRegisteredCallbacks:Z

    .line 85
    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 87
    :cond_0
    return-void
.end method

.method private setAttached()V
    .locals 5

    .prologue
    .line 149
    iget-boolean v2, p0, Lcom/vk/core/widget/LifecycleHandler;->attached:Z

    if-nez v2, :cond_0

    .line 150
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/vk/core/widget/LifecycleHandler;->attached:Z

    .line 152
    iget-object v2, p0, Lcom/vk/core/widget/LifecycleHandler;->pendingPermissionRequests:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    .line 153
    iget-object v2, p0, Lcom/vk/core/widget/LifecycleHandler;->pendingPermissionRequests:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;

    .line 154
    .local v1, "request":Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;
    iget-object v2, v1, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;->instanceId:Ljava/lang/String;

    iget-object v3, v1, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;->permissions:[Ljava/lang/String;

    iget v4, v1, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;->requestCode:I

    invoke-virtual {p0, v2, v3, v4}, Lcom/vk/core/widget/LifecycleHandler;->requestPermissions(Ljava/lang/String;[Ljava/lang/String;I)V

    .line 152
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 157
    .end local v0    # "i":I
    .end local v1    # "request":Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;
    :cond_0
    return-void
.end method


# virtual methods
.method public getLifecycleActivity()Landroid/app/Activity;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method public getLifecycleListener()Lcom/vk/core/widget/LifecycleListener;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    return-object v0
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 269
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->activity:Landroid/app/Activity;

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/vk/core/widget/LifecycleHandler;->findInActivity(Landroid/app/Activity;)Lcom/vk/core/widget/LifecycleHandler;

    move-result-object v0

    if-ne v0, p0, :cond_0

    .line 270
    iput-object p1, p0, Lcom/vk/core/widget/LifecycleHandler;->activity:Landroid/app/Activity;

    .line 272
    :cond_0
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 316
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 294
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->activity:Landroid/app/Activity;

    if-ne v0, p1, :cond_0

    .line 295
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    if-eqz v0, :cond_0

    .line 296
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    invoke-virtual {v0, p1}, Lcom/vk/core/widget/LifecycleListener;->onActivityPaused(Landroid/app/Activity;)V

    .line 299
    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 173
    invoke-super {p0, p1, p2, p3}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 175
    iget-object v1, p0, Lcom/vk/core/widget/LifecycleHandler;->activityRequestMap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 176
    .local v0, "instanceId":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 177
    iget-object v1, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    if-eqz v1, :cond_0

    .line 178
    iget-object v1, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    invoke-virtual {v1, v0, p1, p2, p3}, Lcom/vk/core/widget/LifecycleListener;->onActivityResult(Ljava/lang/String;IILandroid/content/Intent;)V

    .line 181
    :cond_0
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 285
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->activity:Landroid/app/Activity;

    if-ne v0, p1, :cond_0

    .line 286
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    if-eqz v0, :cond_0

    .line 287
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    invoke-virtual {v0, p1}, Lcom/vk/core/widget/LifecycleListener;->onActivityResumed(Landroid/app/Activity;)V

    .line 290
    :cond_0
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 313
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 276
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->activity:Landroid/app/Activity;

    if-ne v0, p1, :cond_0

    .line 277
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    if-eqz v0, :cond_0

    .line 278
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    invoke-virtual {v0, p1}, Lcom/vk/core/widget/LifecycleListener;->onActivityStarted(Landroid/app/Activity;)V

    .line 281
    :cond_0
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 303
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->activity:Landroid/app/Activity;

    if-ne v0, p1, :cond_0

    .line 304
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    if-eqz v0, :cond_0

    .line 305
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    invoke-virtual {v0, p1}, Lcom/vk/core/widget/LifecycleListener;->onActivityStopped(Landroid/app/Activity;)V

    .line 308
    :cond_0
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 128
    invoke-super {p0, p1}, Landroid/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 129
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/core/widget/LifecycleHandler;->destroyed:Z

    .line 130
    invoke-direct {p0}, Lcom/vk/core/widget/LifecycleHandler;->setAttached()V

    .line 131
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 135
    invoke-super {p0, p1}, Landroid/app/Fragment;->onAttach(Landroid/content/Context;)V

    .line 136
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/core/widget/LifecycleHandler;->destroyed:Z

    .line 137
    invoke-direct {p0}, Lcom/vk/core/widget/LifecycleHandler;->setAttached()V

    .line 138
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 91
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 93
    if-eqz p1, :cond_0

    .line 94
    const-string/jumbo v3, "LifecycleHandler.permissionRequests"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vk/core/widget/StringSparseArrayParceler;

    .line 95
    .local v2, "permissionParcel":Lcom/vk/core/widget/StringSparseArrayParceler;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/vk/core/widget/StringSparseArrayParceler;->getStringSparseArray()Landroid/util/SparseArray;

    move-result-object v3

    :goto_0
    iput-object v3, p0, Lcom/vk/core/widget/LifecycleHandler;->permissionRequestMap:Landroid/util/SparseArray;

    .line 97
    const-string/jumbo v3, "LifecycleHandler.activityRequests"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/core/widget/StringSparseArrayParceler;

    .line 98
    .local v0, "activityParcel":Lcom/vk/core/widget/StringSparseArrayParceler;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/vk/core/widget/StringSparseArrayParceler;->getStringSparseArray()Landroid/util/SparseArray;

    move-result-object v3

    :goto_1
    iput-object v3, p0, Lcom/vk/core/widget/LifecycleHandler;->activityRequestMap:Landroid/util/SparseArray;

    .line 100
    const-string/jumbo v3, "LifecycleHandler.pendingPermissionRequests"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 101
    .local v1, "pendingRequests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;>;"
    if-eqz v1, :cond_3

    .end local v1    # "pendingRequests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;>;"
    :goto_2
    iput-object v1, p0, Lcom/vk/core/widget/LifecycleHandler;->pendingPermissionRequests:Ljava/util/ArrayList;

    .line 103
    .end local v0    # "activityParcel":Lcom/vk/core/widget/StringSparseArrayParceler;
    .end local v2    # "permissionParcel":Lcom/vk/core/widget/StringSparseArrayParceler;
    :cond_0
    return-void

    .line 95
    .restart local v2    # "permissionParcel":Lcom/vk/core/widget/StringSparseArrayParceler;
    :cond_1
    new-instance v3, Landroid/util/SparseArray;

    invoke-direct {v3}, Landroid/util/SparseArray;-><init>()V

    goto :goto_0

    .line 98
    .restart local v0    # "activityParcel":Lcom/vk/core/widget/StringSparseArrayParceler;
    :cond_2
    new-instance v3, Landroid/util/SparseArray;

    invoke-direct {v3}, Landroid/util/SparseArray;-><init>()V

    goto :goto_1

    .line 101
    .restart local v1    # "pendingRequests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;>;"
    :cond_3
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "pendingRequests":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_2
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 208
    invoke-super {p0, p1, p2}, Landroid/app/Fragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 210
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    if-eqz v0, :cond_0

    .line 211
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    invoke-virtual {v0, p1, p2}, Lcom/vk/core/widget/LifecycleListener;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 213
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 116
    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    .line 118
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 120
    invoke-direct {p0}, Lcom/vk/core/widget/LifecycleHandler;->destroyRouters()V

    .line 121
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->activity:Landroid/app/Activity;

    .line 123
    :cond_0
    return-void
.end method

.method public onDetach()V
    .locals 1

    .prologue
    .line 142
    invoke-super {p0}, Landroid/app/Fragment;->onDetach()V

    .line 144
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/core/widget/LifecycleHandler;->attached:Z

    .line 145
    invoke-direct {p0}, Lcom/vk/core/widget/LifecycleHandler;->destroyRouters()V

    .line 146
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 226
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    if-eqz v0, :cond_0

    .line 227
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    invoke-virtual {v0, p1}, Lcom/vk/core/widget/LifecycleListener;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 228
    const/4 v0, 0x1

    .line 232
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/app/Fragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 217
    invoke-super {p0, p1}, Landroid/app/Fragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    .line 219
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    if-eqz v0, :cond_0

    .line 220
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    invoke-virtual {v0, p1}, Lcom/vk/core/widget/LifecycleListener;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    .line 222
    :cond_0
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "grantResults"    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 185
    invoke-super {p0, p1, p2, p3}, Landroid/app/Fragment;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 187
    iget-object v1, p0, Lcom/vk/core/widget/LifecycleHandler;->permissionRequestMap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 188
    .local v0, "instanceId":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 189
    iget-object v1, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    if-eqz v1, :cond_0

    .line 190
    iget-object v1, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    invoke-virtual {v1, v0, p1, p2, p3}, Lcom/vk/core/widget/LifecycleListener;->onRequestPermissionsResult(Ljava/lang/String;I[Ljava/lang/String;[I)V

    .line 193
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 107
    invoke-super {p0, p1}, Landroid/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 109
    const-string/jumbo v0, "LifecycleHandler.permissionRequests"

    new-instance v1, Lcom/vk/core/widget/StringSparseArrayParceler;

    iget-object v2, p0, Lcom/vk/core/widget/LifecycleHandler;->permissionRequestMap:Landroid/util/SparseArray;

    invoke-direct {v1, v2}, Lcom/vk/core/widget/StringSparseArrayParceler;-><init>(Landroid/util/SparseArray;)V

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 110
    const-string/jumbo v0, "LifecycleHandler.activityRequests"

    new-instance v1, Lcom/vk/core/widget/StringSparseArrayParceler;

    iget-object v2, p0, Lcom/vk/core/widget/LifecycleHandler;->activityRequestMap:Landroid/util/SparseArray;

    invoke-direct {v1, v2}, Lcom/vk/core/widget/StringSparseArrayParceler;-><init>(Landroid/util/SparseArray;)V

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 111
    const-string/jumbo v0, "LifecycleHandler.pendingPermissionRequests"

    iget-object v1, p0, Lcom/vk/core/widget/LifecycleHandler;->pendingPermissionRequests:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 112
    return-void
.end method

.method public registerForActivityResult(Ljava/lang/String;I)V
    .locals 1
    .param p1, "instanceId"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "requestCode"    # I

    .prologue
    .line 236
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->activityRequestMap:Landroid/util/SparseArray;

    invoke-virtual {v0, p2, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 237
    return-void
.end method

.method public requestPermissions(Ljava/lang/String;[Ljava/lang/String;I)V
    .locals 2
    .param p1, "instanceId"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "permissions"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "requestCode"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .prologue
    .line 259
    iget-boolean v0, p0, Lcom/vk/core/widget/LifecycleHandler;->attached:Z

    if-eqz v0, :cond_0

    .line 260
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->permissionRequestMap:Landroid/util/SparseArray;

    invoke-virtual {v0, p3, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 261
    invoke-virtual {p0, p2, p3}, Lcom/vk/core/widget/LifecycleHandler;->requestPermissions([Ljava/lang/String;I)V

    .line 265
    :goto_0
    return-void

    .line 263
    :cond_0
    iget-object v0, p0, Lcom/vk/core/widget/LifecycleHandler;->pendingPermissionRequests:Ljava/util/ArrayList;

    new-instance v1, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;

    invoke-direct {v1, p1, p2, p3}, Lcom/vk/core/widget/LifecycleHandler$PendingPermissionRequest;-><init>(Ljava/lang/String;[Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public setLifecycleListener(Lcom/vk/core/widget/LifecycleListener;)V
    .locals 0
    .param p1, "lifecycleListener"    # Lcom/vk/core/widget/LifecycleListener;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    .line 78
    return-void
.end method

.method public shouldShowRequestPermissionRationale(Ljava/lang/String;)Z
    .locals 2
    .param p1, "permission"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 197
    iget-object v1, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    if-eqz v1, :cond_0

    .line 198
    iget-object v1, p0, Lcom/vk/core/widget/LifecycleHandler;->lifecycleListener:Lcom/vk/core/widget/LifecycleListener;

    invoke-virtual {v1, p1}, Lcom/vk/core/widget/LifecycleListener;->handleRequestedPermission(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 199
    .local v0, "handled":Ljava/lang/Boolean;
    if-eqz v0, :cond_0

    .line 200
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 203
    .end local v0    # "handled":Ljava/lang/Boolean;
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1}, Landroid/app/Fragment;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public startActivityForResult(Ljava/lang/String;Landroid/content/Intent;I)V
    .locals 0
    .param p1, "instanceId"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "requestCode"    # I

    .prologue
    .line 248
    invoke-virtual {p0, p1, p3}, Lcom/vk/core/widget/LifecycleHandler;->registerForActivityResult(Ljava/lang/String;I)V

    .line 249
    invoke-virtual {p0, p2, p3}, Lcom/vk/core/widget/LifecycleHandler;->startActivityForResult(Landroid/content/Intent;I)V

    .line 250
    return-void
.end method

.method public startActivityForResult(Ljava/lang/String;Landroid/content/Intent;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "instanceId"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "requestCode"    # I
    .param p4, "options"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 253
    invoke-virtual {p0, p1, p3}, Lcom/vk/core/widget/LifecycleHandler;->registerForActivityResult(Ljava/lang/String;I)V

    .line 254
    invoke-virtual {p0, p2, p3, p4}, Lcom/vk/core/widget/LifecycleHandler;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    .line 255
    return-void
.end method

.method public unregisterForActivityResults(Ljava/lang/String;)V
    .locals 3
    .param p1, "instanceId"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 240
    iget-object v1, p0, Lcom/vk/core/widget/LifecycleHandler;->activityRequestMap:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 241
    iget-object v1, p0, Lcom/vk/core/widget/LifecycleHandler;->activityRequestMap:Landroid/util/SparseArray;

    iget-object v2, p0, Lcom/vk/core/widget/LifecycleHandler;->activityRequestMap:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 242
    iget-object v1, p0, Lcom/vk/core/widget/LifecycleHandler;->activityRequestMap:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->removeAt(I)V

    .line 240
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 245
    :cond_1
    return-void
.end method
