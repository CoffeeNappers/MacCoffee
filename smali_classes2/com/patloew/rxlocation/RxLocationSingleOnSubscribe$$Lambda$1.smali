.class final synthetic Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Cancellable;


# instance fields
.field private final arg$1:Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;

.field private final arg$2:Lcom/google/android/gms/common/api/GoogleApiClient;


# direct methods
.method private constructor <init>(Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$$Lambda$1;->arg$1:Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;

    iput-object p2, p0, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$$Lambda$1;->arg$2:Lcom/google/android/gms/common/api/GoogleApiClient;

    return-void
.end method

.method public static lambdaFactory$(Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;Lcom/google/android/gms/common/api/GoogleApiClient;)Lio/reactivex/functions/Cancellable;
    .locals 1

    new-instance v0, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$$Lambda$1;-><init>(Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    return-object v0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    iget-object v0, p0, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$$Lambda$1;->arg$1:Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;

    iget-object v1, p0, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe$$Lambda$1;->arg$2:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-static {v0, v1}, Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;->lambda$subscribe$0(Lcom/patloew/rxlocation/RxLocationSingleOnSubscribe;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    return-void
.end method
