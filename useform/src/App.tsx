import { Checkbox } from '@mui/material'
import { Controller, useForm } from 'react-hook-form'
import Select from 'react-select'
import './App.css'

type FormData = {
  firstName: string
  lastName: string
  age: number
  flavor: {}
  checked: boolean
  mail: string
}

function App() {
  const {
    register,
    handleSubmit,
    control,
    formState: { errors },
  } = useForm<FormData>({})
  const onSubmit = handleSubmit((data) => console.log(data))

  return (
    <div className="App">
      <form onSubmit={onSubmit}>
        <div>
          <label>First Name</label>
          <input
            type="text"
            {...(register('firstName', { required: true }))}
            aria-invalid={errors.firstName ? 'true' : 'false'}
          />
          {errors.firstName?.type === 'required' && (
            <p role="alert">First Name is required</p>
          )}
        </div>
        <div>
          <label>Last Name</label>
          <input type="text" {...register('lastName')} />
        </div>
        <div>
          <label>Age</label>
          <input type="number" {...register('age')} />
        </div>
        <label>Flavor</label>
        <Controller
          name="flavor"
          control={control}
          render={({ field }) => (
            <Select
              {...field}
              options={[
                { value: 'chocolate', label: 'Chocolate' },
                { value: 'strawberry', label: 'Strawberry' },
                { value: 'vanilla', label: 'Vanilla' },
              ]}
            />
          )}
        />
        <Controller
          name="checked"
          control={control}
          rules={{ required: true }}
          render={({ field }) => <Checkbox {...field} />}
        />
        <input
          {...register('mail', { required: 'Email address is required' })}
          aria-invalid={errors.mail ? 'true' : 'false'}
        />
        {errors.mail && <p role='alert'>{errors.mail.message}</p>}
        <button type="submit">送信</button>
      </form>
    </div>
  )
}

export default App
