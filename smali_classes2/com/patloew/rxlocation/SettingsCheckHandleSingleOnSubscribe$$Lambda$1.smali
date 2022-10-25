.class final synthetic Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/ResultCallback;


# instance fields
.field private final arg$1:Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;

.field private final arg$2:Lio/reactivex/SingleEmitter;


# direct methods
.method private constructor <init>(Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;Lio/reactivex/SingleEmitter;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe$$Lambda$1;->arg$1:Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;

    iput-object p2, p0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe$$Lambda$1;->arg$2:Lio/reactivex/SingleEmitter;

    return-void
.end method

.method public static lambdaFactory$(Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;Lio/reactivex/SingleEmitter;)Lcom/google/android/gms/common/api/ResultCallback;
    .locals 1

    new-instance v0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe$$Lambda$1;-><init>(Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;Lio/reactivex/SingleEmitter;)V

    return-object v0
.end method


# virtual methods
.method public onResult(Lcom/google/android/gms/common/api/Result;)V
    .locals 2

    iget-object v0, p0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe$$Lambda$1;->arg$1:Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;

    iget-object v1, p0, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe$$Lambda$1;->arg$2:Lio/reactivex/SingleEmitter;

    check-cast p1, Lcom/google/android/gms/location/LocationSettingsResult;

    invoke-static {v0, v1, p1}, Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;->lambda$onGoogleApiClientReady$0(Lcom/patloew/rxlocation/SettingsCheckHandleSingleOnSubscribe;Lio/reactivex/SingleEmitter;Lcom/google/android/gms/location/LocationSettingsResult;)V

    return-void
.end method
