.class Lcom/google/android/gms/measurement/internal/zzag$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzag;->zzbzb()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic avP:Lcom/google/android/gms/measurement/internal/zzag;

.field final synthetic avQ:J


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzag;J)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzag$3;->avP:Lcom/google/android/gms/measurement/internal/zzag;

    iput-wide p2, p0, Lcom/google/android/gms/measurement/internal/zzag$3;->avQ:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzag$3;->avP:Lcom/google/android/gms/measurement/internal/zzag;

    iget-wide v2, p0, Lcom/google/android/gms/measurement/internal/zzag$3;->avQ:J

    invoke-static {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzag;->zza(Lcom/google/android/gms/measurement/internal/zzag;J)V

    return-void
.end method
