.class Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;
.super Ljava/lang/Object;
.source "LocationUpdatesFlowableOnSubscribe.java"

# interfaces
.implements Lcom/google/android/gms/location/LocationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "RxLocationListener"
.end annotation


# instance fields
.field private emitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter",
            "<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/FlowableEmitter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/FlowableEmitter",
            "<",
            "Landroid/location/Location;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p1, "emitter":Lio/reactivex/FlowableEmitter;, "Lio/reactivex/FlowableEmitter<Landroid/location/Location;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;->emitter:Lio/reactivex/FlowableEmitter;

    .line 65
    return-void
.end method


# virtual methods
.method public onLocationChanged(Landroid/location/Location;)V
    .locals 1
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;->emitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;->emitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 74
    :cond_0
    return-void
.end method

.method onUnsubscribed()V
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/patloew/rxlocation/LocationUpdatesFlowableOnSubscribe$RxLocationListener;->emitter:Lio/reactivex/FlowableEmitter;

    .line 69
    return-void
.end method
