.class final synthetic Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/maps/OnMapReadyCallback;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment;)Lcom/google/android/gms/maps/OnMapReadyCallback;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment;)V

    return-object v0
.end method


# virtual methods
.method public onMapReady(Lcom/google/android/gms/maps/GoogleMap;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment;->lambda$initMap$3(Lcom/google/android/gms/maps/GoogleMap;)V

    return-void
.end method
