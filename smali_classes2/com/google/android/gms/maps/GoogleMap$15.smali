.class Lcom/google/android/gms/maps/GoogleMap$15;
.super Lcom/google/android/gms/maps/internal/zzaa$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/maps/GoogleMap;->setOnPolylineClickListener(Lcom/google/android/gms/maps/GoogleMap$OnPolylineClickListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic anS:Lcom/google/android/gms/maps/GoogleMap;

.field final synthetic aoi:Lcom/google/android/gms/maps/GoogleMap$OnPolylineClickListener;


# direct methods
.method constructor <init>(Lcom/google/android/gms/maps/GoogleMap;Lcom/google/android/gms/maps/GoogleMap$OnPolylineClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/maps/GoogleMap$15;->anS:Lcom/google/android/gms/maps/GoogleMap;

    iput-object p2, p0, Lcom/google/android/gms/maps/GoogleMap$15;->aoi:Lcom/google/android/gms/maps/GoogleMap$OnPolylineClickListener;

    invoke-direct {p0}, Lcom/google/android/gms/maps/internal/zzaa$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/maps/model/internal/IPolylineDelegate;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMap$15;->aoi:Lcom/google/android/gms/maps/GoogleMap$OnPolylineClickListener;

    new-instance v1, Lcom/google/android/gms/maps/model/Polyline;

    invoke-direct {v1, p1}, Lcom/google/android/gms/maps/model/Polyline;-><init>(Lcom/google/android/gms/maps/model/internal/IPolylineDelegate;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/maps/GoogleMap$OnPolylineClickListener;->onPolylineClick(Lcom/google/android/gms/maps/model/Polyline;)V

    return-void
.end method
