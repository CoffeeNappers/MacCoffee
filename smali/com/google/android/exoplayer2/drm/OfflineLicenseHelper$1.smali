.class Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;
.super Ljava/lang/Object;
.source "OfflineLicenseHelper.java"

# interfaces
.implements Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$EventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;-><init>(Lcom/google/android/exoplayer2/drm/ExoMediaDrm;Lcom/google/android/exoplayer2/drm/MediaDrmCallback;Ljava/util/HashMap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;


# direct methods
.method constructor <init>(Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;

    .prologue
    .line 135
    .local p0, "this":Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;, "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;"
    iput-object p1, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;->this$0:Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDrmKeysLoaded()V
    .locals 1

    .prologue
    .line 138
    .local p0, "this":Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;, "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;"
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;->this$0:Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;

    invoke-static {v0}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->access$000(Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->open()V

    .line 139
    return-void
.end method

.method public onDrmKeysRemoved()V
    .locals 1

    .prologue
    .line 153
    .local p0, "this":Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;, "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;"
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;->this$0:Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;

    invoke-static {v0}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->access$000(Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->open()V

    .line 154
    return-void
.end method

.method public onDrmKeysRestored()V
    .locals 1

    .prologue
    .line 148
    .local p0, "this":Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;, "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;"
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;->this$0:Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;

    invoke-static {v0}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->access$000(Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->open()V

    .line 149
    return-void
.end method

.method public onDrmSessionManagerError(Ljava/lang/Exception;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 143
    .local p0, "this":Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;, "Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;"
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper$1;->this$0:Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;

    invoke-static {v0}, Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;->access$000(Lcom/google/android/exoplayer2/drm/OfflineLicenseHelper;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->open()V

    .line 144
    return-void
.end method
