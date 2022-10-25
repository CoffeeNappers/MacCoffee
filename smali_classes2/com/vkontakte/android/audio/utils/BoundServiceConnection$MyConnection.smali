.class Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;
.super Ljava/lang/Object;
.source "BoundServiceConnection.java"

# interfaces
.implements Landroid/content/ServiceConnection;
.implements Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/utils/BoundServiceConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyConnection"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/utils/BoundServiceConnection;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/utils/BoundServiceConnection;)V
    .locals 0

    .prologue
    .line 91
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>.MyConnection;"
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;->this$0:Lcom/vkontakte/android/audio/utils/BoundServiceConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/utils/BoundServiceConnection;Lcom/vkontakte/android/audio/utils/BoundServiceConnection$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/utils/BoundServiceConnection;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/utils/BoundServiceConnection$1;

    .prologue
    .line 91
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>.MyConnection;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;-><init>(Lcom/vkontakte/android/audio/utils/BoundServiceConnection;)V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 94
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>.MyConnection;"
    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;->this$0:Lcom/vkontakte/android/audio/utils/BoundServiceConnection;

    check-cast p2, Lcom/vkontakte/android/audio/utils/BoundService$Binder;

    .end local p2    # "service":Landroid/os/IBinder;
    iget-object v0, p2, Lcom/vkontakte/android/audio/utils/BoundService$Binder;->service:Lcom/vkontakte/android/audio/utils/BoundService;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->checkedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/utils/BoundService;

    invoke-static {v1, v0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->access$102(Lcom/vkontakte/android/audio/utils/BoundServiceConnection;Lcom/vkontakte/android/audio/utils/BoundService;)Lcom/vkontakte/android/audio/utils/BoundService;

    .line 95
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;->this$0:Lcom/vkontakte/android/audio/utils/BoundServiceConnection;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->access$100(Lcom/vkontakte/android/audio/utils/BoundServiceConnection;)Lcom/vkontakte/android/audio/utils/BoundService;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/audio/utils/BoundService;->registerOnServiceLoadedListener(Lcom/vkontakte/android/audio/utils/BoundService$OnServiceLoadedListener;)V

    .line 96
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 100
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>.MyConnection;"
    return-void
.end method

.method public onServiceLoaded()V
    .locals 1

    .prologue
    .line 104
    .local p0, "this":Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;, "Lcom/vkontakte/android/audio/utils/BoundServiceConnection<TT;>.MyConnection;"
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;->this$0:Lcom/vkontakte/android/audio/utils/BoundServiceConnection;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->onConnected()V

    .line 105
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;->this$0:Lcom/vkontakte/android/audio/utils/BoundServiceConnection;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->access$200(Lcom/vkontakte/android/audio/utils/BoundServiceConnection;)Lcom/vkontakte/android/audio/utils/BoundServiceConnection$BoundServiceConnectionListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnection$MyConnection;->this$0:Lcom/vkontakte/android/audio/utils/BoundServiceConnection;

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection;->access$200(Lcom/vkontakte/android/audio/utils/BoundServiceConnection;)Lcom/vkontakte/android/audio/utils/BoundServiceConnection$BoundServiceConnectionListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/vkontakte/android/audio/utils/BoundServiceConnection$BoundServiceConnectionListener;->onConnected()V

    .line 107
    :cond_0
    return-void
.end method
