.class Lcom/google/android/gms/measurement/internal/zzae$5;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzae;->zzb(Lcom/google/android/gms/measurement/internal/UserAttributeParcel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic auK:Lcom/google/android/gms/measurement/internal/UserAttributeParcel;

.field final synthetic avB:Z

.field final synthetic avz:Lcom/google/android/gms/measurement/internal/zzae;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzae;ZLcom/google/android/gms/measurement/internal/UserAttributeParcel;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzae$5;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    iput-boolean p2, p0, Lcom/google/android/gms/measurement/internal/zzae$5;->avB:Z

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzae$5;->auK:Lcom/google/android/gms/measurement/internal/UserAttributeParcel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$5;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzc(Lcom/google/android/gms/measurement/internal/zzae;)Lcom/google/android/gms/measurement/internal/zzm;

    move-result-object v1

    if-nez v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$5;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v1, "Discarding data. Failed to set user attribute"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzae$5;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzae$5;->avB:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v2, v1, v0}, Lcom/google/android/gms/measurement/internal/zzae;->zza(Lcom/google/android/gms/measurement/internal/zzm;Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$5;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzd(Lcom/google/android/gms/measurement/internal/zzae;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$5;->auK:Lcom/google/android/gms/measurement/internal/UserAttributeParcel;

    goto :goto_1
.end method
